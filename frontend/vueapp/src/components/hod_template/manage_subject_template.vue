{% extends 'hod_template/base_template.vue' %}

{% block page_title %}
    Manage Subjects
{% endblock page_title %}

{% block content %}

{% load static %}

        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content">
                    <a class="btn btn-primary" href="{% url 'add_subject' %}" role="button">+ Agregar Tutoría</a> <br/>&nbsp;
                    {% comment %} Display Messages {% endcomment %}
                    {% include 'message.vue' %}  

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Detalles</h3>

                                    <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control float-right" placeholder="Buscar">

                                        <div class="input-group-append">
                                        <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                            <th>ID</th>
                                            <th>Nombre de tutoría</th>
                                            <th>Curso</th>
                                            <th>Profesor</th>
                                            <th>Creado</th>
                                            <th>Actualizado</th>
                                            <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {% for subject in subjects %}
                                            <tr>
                                            <td>{{ subject.id }}</td>
                                            <td>{{ subject.subject_name }}</td>
                                            <td>{{ subject.course_id.course_name }}</td>
                                            <td>{{ subject.staff_id.first_name }} {{ subject.staff_id.last_name }}</td>
                                            <td>{{ subject.created_at }}</td>
                                            <td>{{ subject.updated_at }}</td>
                                            <td>
                                                <a href="{% url 'edit_subject' subject.id %}" class="btn btn-success">Editar</a> 
                                                <a href="{% url 'delete_subject' subject.id %}" class="btn btn-danger">Eliminar</a>
                                            </td>
                                            </tr>
                                            {% endfor %}
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

{% endblock content %}