{% extends 'student_template/base_template.vue' %}
{% load static %}

{% block content %}

        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Ver Asistencia</h3>
                            </div>

                            {% comment %} Display Messages {% endcomment %}
                            {% include 'message.vue' %}
                                
                            <form method="POST" action="{% url 'student_view_attendance_post' %}">
                                {% csrf_token %}

                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Tutoría</label>
                                        <select class="form-control" name="subject" id="subject">
                                            {% for subject in subjects %}
                                                <option value="{{ subject.id }}">{{ subject.subject_name }}</option>
                                            {% endfor %}
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Inicio</label>
                                                <input type="date" class="form-control" name="start_date" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Fin</label>
                                                <input type="date" class="form-control" name="end_date" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary" id="fetch_student">Obtener Asistencia</button>
                                </div>
                                <div class="card-footer" id="student_data"></div>
                            </form>
                        </div>
                    </div>
                </div>

{% endblock content %}