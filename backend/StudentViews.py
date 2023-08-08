from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from django.core.files.storage import FileSystemStorage 
from django.urls import reverse
import datetime

from backend.models import CustomUser, Staffs, Courses, Subjects, Students, Attendance, AttendanceReport, LeaveReportStudent, FeedBackStudent, StudentResult


def student_home(request):
    student_obj = Students.objects.get(admin=request.user.id)
    total_attendance = AttendanceReport.objects.filter(student_id=student_obj).count()
    attendance_present = AttendanceReport.objects.filter(student_id=student_obj, status=True).count()
    attendance_absent = AttendanceReport.objects.filter(student_id=student_obj, status=False).count()

    course_obj = Courses.objects.get(id=student_obj.course_id.id)
    total_subjects = Subjects.objects.filter(course_id=course_obj).count()

    subject_name = []
    data_present = []
    data_absent = []
    subject_data = Subjects.objects.filter(course_id=student_obj.course_id)
    for subject in subject_data:
        attendance = Attendance.objects.filter(subject_id=subject.id)
        attendance_present_count = AttendanceReport.objects.filter(attendance_id__in=attendance, status=True, student_id=student_obj.id).count()
        attendance_absent_count = AttendanceReport.objects.filter(attendance_id__in=attendance, status=False, student_id=student_obj.id).count()
        subject_name.append(subject.subject_name)
        data_present.append(attendance_present_count)
        data_absent.append(attendance_absent_count)
    
    context={
        "total_attendance": total_attendance,
        "attendance_present": attendance_present,
        "attendance_absent": attendance_absent,
        "total_subjects": total_subjects,
        "subject_name": subject_name,
        "data_present": data_present,
        "data_absent": data_absent
    }
    return render(request, "student_template/student_home_template.vue", context)


def student_view_attendance(request):
    student = Students.objects.get(admin=request.user.id) # Cómo iniciar sesión en los datos del estudiante
    course = student.course_id # Inscripción en el curso del estudiante que ha iniciado sesión
    # course = Courses.objects.get(id=student.course_id.id) # Inscripción en el curso del estudiante que ha iniciado sesión
    subjects = Subjects.objects.filter(course_id=course) # Inscripción de las materias del curso
    context = {
        "subjects": subjects
    }
    return render(request, "student_template/student_view_attendance.vue", context)


def student_view_attendance_post(request):
    if request.method != "POST":
        messages.error(request, "Metodo invalido estudiante ver")
        return redirect('student_view_attendance')
    else:
        # Obtener todos los datos de entrada
        subject_id = request.POST.get('subject')
        start_date = request.POST.get('start_date')
        end_date = request.POST.get('end_date')

        # Analizando los datos de la fecha en el objeto de Python
        start_date_parse = datetime.datetime.strptime(start_date, '%Y-%m-%d').date()
        end_date_parse = datetime.datetime.strptime(end_date, '%Y-%m-%d').date()

        # Obtención de todos los datos del sujeto en función del sujeto seleccionado
        subject_obj = Subjects.objects.get(id=subject_id)
        # Obtener datos de usuario registrados
        user_obj = CustomUser.objects.get(id=request.user.id)
        # Obtención de datos de estudiantes basados en datos registrados
        stud_obj = Students.objects.get(admin=user_obj)

        # Accediendo ahora a los datos de asistencia en función del rango de fechas seleccionadas y el tema seleccionado
        attendance = Attendance.objects.filter(attendance_date__range=(start_date_parse, end_date_parse), subject_id=subject_obj)
        # Obtención del informe de asistencia basado en los detalles de asistencia obtenidos anteriormente
        attendance_reports = AttendanceReport.objects.filter(attendance_id__in=attendance, student_id=stud_obj)

        context = {
            "subject_obj": subject_obj,
            "attendance_reports": attendance_reports
        }

        return render(request, 'student_template/student_attendance_data.vue', context)
       

def student_apply_leave(request):
    student_obj = Students.objects.get(admin=request.user.id)
    leave_data = LeaveReportStudent.objects.filter(student_id=student_obj)
    context = {
        "leave_data": leave_data
    }
    return render(request, 'student_template/student_apply_leave.vue', context)


def student_apply_leave_save(request):
    if request.method != "POST":
        messages.error(request, "Metodo invalido estudiante save")
        return redirect('student_apply_leave')
    else:
        leave_date = request.POST.get('leave_date')
        leave_message = request.POST.get('leave_message')

        student_obj = Students.objects.get(admin=request.user.id)
        try:
            leave_report = LeaveReportStudent(student_id=student_obj, leave_date=leave_date, leave_message=leave_message, leave_status=0)
            leave_report.save()
            messages.success(request, "Sesion solicitada.")
            return redirect('student_apply_leave')
        except:
            messages.error(request, "Error en Sesion solicitada")
            return redirect('student_apply_leave')


def student_feedback(request):
    student_obj = Students.objects.get(admin=request.user.id)
    feedback_data = FeedBackStudent.objects.filter(student_id=student_obj)
    context = {
        "feedback_data": feedback_data
    }
    return render(request, 'student_template/student_feedback.vue', context)


def student_feedback_save(request):
    if request.method != "POST":
        messages.error(request, "Metodo invalido")
        return redirect('student_feedback')
    else:
        feedback = request.POST.get('feedback_message')
        student_obj = Students.objects.get(admin=request.user.id)

        try:
            add_feedback = FeedBackStudent(student_id=student_obj, feedback=feedback, feedback_reply="")
            add_feedback.save()
            messages.success(request, "Comentarios enviados.")
            return redirect('student_feedback')
        except:
            messages.error(request, "Error al enviar comentarios.")
            return redirect('student_feedback')


def student_profile(request):
    user = CustomUser.objects.get(id=request.user.id)
    student = Students.objects.get(admin=user)

    context={
        "user": user,
        "student": student
    }
    return render(request, 'student_template/student_profile.vue', context)


def student_profile_update(request):
    if request.method != "POST":
        messages.error(request, "Metodo invalido actualizar estudioante!")
        return redirect('student_profile')
    else:
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        password = request.POST.get('password')
        address = request.POST.get('address')

        try:
            customuser = CustomUser.objects.get(id=request.user.id)
            customuser.first_name = first_name
            customuser.last_name = last_name
            if password != None and password != "":
                customuser.set_password(password)
            customuser.save()

            student = Students.objects.get(admin=customuser.id)
            student.address = address
            student.save()
            
            messages.success(request, "Perfil actualizado con éxito")
            return redirect('student_profile')
        except:
            messages.error(request, "No se pudo actualizar el perfil")
            return redirect('student_profile')


def student_view_result(request):
    student = Students.objects.get(admin=request.user.id)
    student_result = StudentResult.objects.filter(student_id=student.id)
    context = {
        "student_result": student_result,
    }
    return render(request, "student_template/student_view_result.vue", context)





