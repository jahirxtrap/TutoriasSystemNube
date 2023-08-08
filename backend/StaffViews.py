from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib import messages
from django.core.files.storage import FileSystemStorage #To upload Profile Picture
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers
import json


from backend.models import CustomUser, Staffs, Courses, Subjects, Students, SessionYearModel, Attendance, AttendanceReport, LeaveReportStaff, FeedBackStaffs, StudentResult


def staff_home(request):
    # Obtención de todos los estudiantes

    subjects = Subjects.objects.filter(staff_id=request.user.id)
    course_id_list = []
    for subject in subjects:
        course = Courses.objects.get(id=subject.course_id.id)
        course_id_list.append(course.id)
    
    final_course = []
    # Eliminación de ID de curso duplicado
    for course_id in course_id_list:
        if course_id not in final_course:
            final_course.append(course_id)
    
    students_count = Students.objects.filter(course_id__in=final_course).count()
    subject_count = subjects.count()

    # Obtener todo el recuento de asistencia
    attendance_count = Attendance.objects.filter(subject_id__in=subjects).count()
    # Obtener todo Aprobar licencia
    staff = Staffs.objects.get(admin=request.user.id)
    leave_count = LeaveReportStaff.objects.filter(staff_id=staff.id, leave_status=1).count()

    #Obtener datos de asistencia por sujetos
    subject_list = []
    attendance_list = []
    for subject in subjects:
        attendance_count1 = Attendance.objects.filter(subject_id=subject.id).count()
        subject_list.append(subject.subject_name)
        attendance_list.append(attendance_count1)

    students_attendance = Students.objects.filter(course_id__in=final_course)
    student_list = []
    student_list_attendance_present = []
    student_list_attendance_absent = []
    for student in students_attendance:
        attendance_present_count = AttendanceReport.objects.filter(status=True, student_id=student.id).count()
        attendance_absent_count = AttendanceReport.objects.filter(status=False, student_id=student.id).count()
        student_list.append(student.admin.first_name+" "+ student.admin.last_name)
        student_list_attendance_present.append(attendance_present_count)
        student_list_attendance_absent.append(attendance_absent_count)

    context={
        "students_count": students_count,
        "attendance_count": attendance_count,
        "leave_count": leave_count,
        "subject_count": subject_count,
        "subject_list": subject_list,
        "attendance_list": attendance_list,
        "student_list": student_list,
        "attendance_present_list": student_list_attendance_present,
        "attendance_absent_list": student_list_attendance_absent
    }
    return render(request, "staff_template/staff_home_template.vue", context)



def staff_take_attendance(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    session_years = SessionYearModel.objects.all()
    context = {
        "subjects": subjects,
        "session_years": session_years
    }
    return render(request, "staff_template/take_attendance_template.vue", context)


def staff_apply_leave(request):
    staff_obj = Staffs.objects.get(admin=request.user.id)
    leave_data = LeaveReportStaff.objects.filter(staff_id=staff_obj)
    context = {
        "leave_data": leave_data
    }
    return render(request, "staff_template/staff_apply_leave_template.vue", context)


def staff_apply_leave_save(request):
    if request.method != "POST":
        messages.error(request, "Metodo Invalido Profes save")
        return redirect('staff_apply_leave')
    else:
        leave_date = request.POST.get('leave_date')
        leave_message = request.POST.get('leave_message')

        staff_obj = Staffs.objects.get(admin=request.user.id)
        try:
            leave_report = LeaveReportStaff(staff_id=staff_obj, leave_date=leave_date, leave_message=leave_message, leave_status=0)
            leave_report.save()
            messages.success(request, "Solicitó Autorizacion.")
            return redirect('staff_apply_leave')
        except:
            messages.error(request, "Fallo al Solicitar Autorizacion")
            return redirect('staff_apply_leave')


def staff_feedback(request):
    staff_obj = Staffs.objects.get(admin=request.user.id)
    feedback_data = FeedBackStaffs.objects.filter(staff_id=staff_obj)
    context = {
        "feedback_data":feedback_data
    }
    return render(request, "staff_template/staff_feedback_template.vue", context)


def staff_feedback_save(request):
    if request.method != "POST":
        messages.error(request, "Metodo invalido")
        return redirect('staff_feedback')
    else:
        feedback = request.POST.get('feedback_message')
        staff_obj = Staffs.objects.get(admin=request.user.id)

        try:
            add_feedback = FeedBackStaffs(staff_id=staff_obj, feedback=feedback, feedback_reply="")
            add_feedback.save()
            messages.success(request, "Comentarios enviados.")
            return redirect('staff_feedback')
        except:
            messages.error(request, "Error al enviar comentarios.")
            return redirect('staff_feedback')


# NO necesitamos csrf_token cuando usamos Ajax
@csrf_exempt
def get_students(request):
    # Obtener valores de Ajax POST 'Fetch Student'
    subject_id = request.POST.get("subject")
    session_year = request.POST.get("session_year")

    # Los estudiantes se inscriben en el curso, el curso tiene asignaturas
     # Obtener todos los datos del modelo sujeto basado en subject_id   
    subject_model = Subjects.objects.get(id=subject_id)

    session_model = SessionYearModel.objects.get(id=session_year)

    students = Students.objects.filter(course_id=subject_model.course_id, session_year_id=session_model)

    # Únicamente aprobando la identificación del estudiante y el nombre del estudiante solamente
    list_data = []

    for student in students:
        data_small={"id":student.admin.id, "nombre":student.admin.first_name+" "+student.admin.last_name}
        list_data.append(data_small)

    return JsonResponse(json.dumps(list_data), content_type="application/json", safe=False)




@csrf_exempt
def save_attendance_data(request):
    # Obtener valores del formulario de asistencia del personal a través de AJAX (JavaScript)
     # Use getlist para acceder a la matriz HTML/Lista de datos de entrada
    student_ids = request.POST.get("student_ids")
    subject_id = request.POST.get("subject_id")
    attendance_date = request.POST.get("attendance_date")
    session_year_id = request.POST.get("session_year_id")

    subject_model = Subjects.objects.get(id=subject_id)
    session_year_model = SessionYearModel.objects.get(id=session_year_id)

    json_student = json.loads(student_ids)
    # print(dict_student[0]['id'])

    # print(student_ids)
    try:
        # Los datos de la primera asistencia se guardan en el modelo de asistencia
        attendance = Attendance(subject_id=subject_model, attendance_date=attendance_date, session_year_id=session_year_model)
        attendance.save()

        for stud in json_student:
            # Asistencia de estudiante individual guardada en el modelo de informe de asistencia
            student = Students.objects.get(admin=stud['id'])
            attendance_report = AttendanceReport(student_id=student, attendance_id=attendance, status=stud['status'])
            attendance_report.save()
        return HttpResponse("OK")
    except:
        return HttpResponse("Error")




def staff_update_attendance(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    session_years = SessionYearModel.objects.all()
    context = {
        "subjects": subjects,
        "session_years": session_years
    }
    return render(request, "staff_template/update_attendance_template.vue", context)

@csrf_exempt
def get_attendance_dates(request):
    
    subject_id = request.POST.get("subject")
    session_year = request.POST.get("session_year_id")
    subject_model = Subjects.objects.get(id=subject_id)

    session_model = SessionYearModel.objects.get(id=session_year)

    attendance = Attendance.objects.filter(subject_id=subject_model, session_year_id=session_model)

    list_data = []

    for attendance_single in attendance:
        data_small={"id":attendance_single.id, "attendance_date":str(attendance_single.attendance_date), "session_year_id":attendance_single.session_year_id.id}
        list_data.append(data_small)

    return JsonResponse(json.dumps(list_data), content_type="application/json", safe=False)


@csrf_exempt
def get_attendance_student(request):

    attendance_date = request.POST.get('attendance_date')
    attendance = Attendance.objects.get(id=attendance_date)

    attendance_data = AttendanceReport.objects.filter(attendance_id=attendance)

    list_data = []

    for student in attendance_data:
        data_small={"id":student.student_id.admin.id, "nombre":student.student_id.admin.first_name+" "+student.student_id.admin.last_name, "status":student.status}
        list_data.append(data_small)

    return JsonResponse(json.dumps(list_data), content_type="application/json", safe=False)


@csrf_exempt
def update_attendance_data(request):
    student_ids = request.POST.get("student_ids")

    attendance_date = request.POST.get("attendance_date")
    attendance = Attendance.objects.get(id=attendance_date)

    json_student = json.loads(student_ids)

    try:
        
        for stud in json_student:
            student = Students.objects.get(admin=stud['id'])

            attendance_report = AttendanceReport.objects.get(student_id=student, attendance_id=attendance)
            attendance_report.status=stud['status']

            attendance_report.save()
        return HttpResponse("OK")
    except:
        return HttpResponse("Error")


def staff_profile(request):
    user = CustomUser.objects.get(id=request.user.id)
    staff = Staffs.objects.get(admin=user)

    context={
        "user": user,
        "staff": staff
    }
    return render(request, 'staff_template/staff_profile.vue', context)


def staff_profile_update(request):
    if request.method != "POST":
        messages.error(request, "Metodo invalido profes update!")
        return redirect('staff_profile')
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

            staff = Staffs.objects.get(admin=customuser.id)
            staff.address = address
            staff.save()

            messages.success(request, "Perfil actualizado con éxito")
            return redirect('staff_profile')
        except:
            messages.error(request, "No se pudo actualizar el perfil")
            return redirect('staff_profile')



def staff_add_result(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    session_years = SessionYearModel.objects.all()
    context = {
        "subjects": subjects,
        "session_years": session_years,
    }
    return render(request, "staff_template/add_result_template.vue", context)


def staff_add_result_save(request):
    if request.method != "POST":
        messages.error(request, "Metodo Invalido profes save add")
        return redirect('staff_add_result')
    else:
        student_admin_id = request.POST.get('student_list')
        assignment_marks = request.POST.get('assignment_marks')
        exam_marks = request.POST.get('exam_marks')
        subject_id = request.POST.get('subject')

        student_obj = Students.objects.get(admin=student_admin_id)
        subject_obj = Subjects.objects.get(id=subject_id)

        try:
            check_exist = StudentResult.objects.filter(subject_id=subject_obj, student_id=student_obj).exists()
            if check_exist:
                result = StudentResult.objects.get(subject_id=subject_obj, student_id=student_obj)
                result.subject_assignment_marks = assignment_marks
                result.subject_exam_marks = exam_marks
                result.save()
                messages.success(request, "Resultado actualizado con éxito!")
                return redirect('staff_add_result')
            else:
                result = StudentResult(student_id=student_obj, subject_id=subject_obj, subject_exam_marks=exam_marks, subject_assignment_marks=assignment_marks)
                result.save()
                messages.success(request, "Resultado agregado con éxito!")
                return redirect('staff_add_result')
        except:
            messages.error(request, "No se pudo agregar el resultado!")
            return redirect('staff_add_result')
