{% extends 'staff_template/base_template.vue' %}
{% load static %}

{% block content %}

        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Ver Actualización de Asistencia</h3>
                            </div>
                            
                            {% comment %} Display Messages {% endcomment %}
                            {% include 'message.vue' %}
                        
                            <div class="card-body">
                            
                                <div class="form-group">
                                    <label>Tutoría</label>
                                    <select class="form-control" name="subject" id="subject">
                                        {% for subject in subjects %}
                                            <option value="{{ subject.id }}">{{ subject.subject_name }}</option>
                                        {% endfor %}
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Fecha de Sesión</label>
                                    <select class="form-control" name="session_year_id" id="session_year_id">
                                        {% for session_year in session_years %}
                                            <option value="{{ session_year.id }}">{{ session_year.session_start_year }} hasta {{ session_year.session_end_year }}</option>
                                        {% endfor %}
                                    </select>
                                </div>
                            </div>

                            <div class="card-footer">
                                <button type="button" class="btn btn-primary" id="fetch_attendance">Obtener fecha de Asistencia</button>
                            </div>

                            <div class="card-footer">
                                <div class="form-group" id="attendance_block" style="display:none;">
                                        <label>Fecha de Asistencia</label>
                                        <select class="form-control" name="attendance_date" id="attendance_date"></select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="alert alert-danger" id="error_attendance" style="display:none;"></div>
                                    <div class="alert alert-success" id="success_attendance" style="display:none;"></div>
                                </div>
                                <div class="card-footer" id="fetch_student_block" style="display:none;">
                                    <button type="button" class="btn btn-primary" id="fetch_student">Obtener datos de Estudiante</button>
                                </div>
                                <div class="card-footer" id="student_data"></div>
                            </div>
                        </div>
                    </div>

{% endblock content %}

{% block custom_js %}

<script>
    $(document).ready(function(){
        

        //Fetching Attendance Date

        $("#fetch_attendance").click(function(){
                var subject = $("#subject").val()
                var session_year_id = $("#session_year_id").val()
                //console.log(subject)
                //console.log(session_year_id)

                $.ajax({
                    url:'{% url 'get_attendance_dates' %}',
                    type:'POST',
                    data:{subject:subject, session_year_id:session_year_id},
                })

                
                .done(function(response){
                    var json_data = JSON.parse(response);
                    if(json_data.length>0)
                    {
                        var html_data = "";
                        for (key in json_data)
                        {
                            html_data+="<option value='"+ json_data[key]["id"] +"'>"+ json_data[key]["attendance_date"] +"</option>"
                        }
                        $("#error_attendance").vue("");
                        $("#error_attendance").hide();
                        $("#attendance_block").show();
                        $("#fetch_student_block").show();
                        $("#attendance_date").vue(html_data);
                        //console.log(response)
                        //alert("Something")
                    }
                    else
                    {
                        $("#error_attendance").vue("No Attendance Data Found.");
                        $("#error_attendance").show();
                        $("#attendance_block").hide();
                        $("#fetch_student_block").hide();
                        $("#attendance_date")="" //Empty the Date Dropdown also
                    }
                    
                })

                .fail(function(){
                    alert("Error in getting Attendance Dates.")
                    $("#error_attendance").vue("");
                    $("#fetch_student_block").hide();
                    $("#attendance_block").hide();
                });

                
        })

        // Now Working on Fetch Student after attendance date selected
        $("#fetch_student").click(function(){

            // Displaying Students Based on Staff, Course and Session Enrolled

            //var subject=$("#subject").val()
            //var session_year=$("#session_year").val()
            var attendance_date=$("#attendance_date").val()

            $.ajax({
                url:'{% url 'get_attendance_student' %}',
                type:'POST',
                data:{attendance_date:attendance_date},
            })

            
            .done(function(response){
                var json_data=JSON.parse(response);
                console.log(json_data)
                //Displaying Attendance Date Input and Students Attendance
                var div_data="<div class='form-group'><label>Student Attendance: </label></div>"
                div_data+="<div class='form-group'><div class='row'>"

                for(key in json_data)
                {
                    div_data+="<div class='col-lg-3'><div class='form-check'><input type='checkbox' ";

                    if(json_data[key]['status'])
                    {
                        div_data+="checked='checked'";
                    }
                    else
                    {
                        div_data+="";
                    }
                    div_data+="name='student_data[]' value='"+ json_data[key]['id'] +"' />  <label class='form-check-label'>"+ json_data[key]['name']+" </label> ";
                    
                    // Displaying Present and Absent

                    if(json_data[key]['status'])
                    {
                        div_data+="<b>[ Present ]</b>";
                    }
                    else
                    {
                        div_data+="<b>[ Absent ]</b>";
                    }
                    //Displaying Present and Absent Ends Here
                    

                    div_data+="</div></div> ";
                }
                div_data+="</div></div>";
                div_data+="<div class='form-group'>";
                div_data+="<button id='save_attendance' class='btn btn-success' type='button'>Save Attendance Data</button>";
                div_data+="</div>";
                $("#student_data").vue(div_data);

            })
            .fail(function(){
                alert("Error in Fetching Students.")
            })



            // Save Attendance Data to Database
            $(document).on("click", "#save_attendance", function(){
                
                //Disabling the Button while data is being saved in Server
                $(this).attr("disabled", "disabled")
                $(this).text("Saving Attendance Data...")

                //console.log("SAVE")
                var student_data=$("input[name='student_data[]'").map(function(){ 
                        if($(this).is(":checked")){
                            return {"id":$(this).val(), "status":1}; // Getting ID and Value of Students
                        }
                        else
                        {
                            return {"id":$(this).val(), "status":0}; // Getting ID and Value of Students
                        }
                    }).get()

                var attendance_date=$("#attendance_date").val();
                
                
                student_data = JSON.stringify(student_data)
                //console.log(student_data);

                // Saving Attendance Data into Database

                $.ajax({
                    url:'{% url 'update_attendance_data' %}',
                    type:'POST',
                    data:{student_ids:student_data, attendance_date:attendance_date},
                })

                
                .done(function(response){
                    
                    if(response=="OK")
                    {
                        alert("Attendance Saved!")
                    }
                    else
                    {
                        alert("Failed to Save Attendance!")
                    }
                    location.reload()
                    
                    //console.log(response)
                })

                .fail(function(){
                    alert("Error in Saving Students Attendance Data.")
                })

            })

        })

    })
</script>
{% endblock custom_js %}