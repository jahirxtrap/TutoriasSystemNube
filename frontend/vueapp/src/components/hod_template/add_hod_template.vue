{% extends 'hod_template/base_template.vue' %}
{% load static %}

{% block content %}

        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Agregar Admin</h3>
                            </div>

                            <form role="form" method="POST" action="{% url 'add_hod_save' %}">
                                {% csrf_token %}
                                {% comment %} Display Messages {% endcomment %}
                                {% include 'message.vue' %}
                                    
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Correo</label>
                                        <input type="email" class="form-control" name="email" placeholder="" id="id_email">
                                    </div>

                                    <div class="form-group">
                                        <label>Nombre de usuario</label>
                                        <input type="text" class="form-control" name="username" placeholder="" id="id_username">
                                    </div>

                                    <div class="form-group">
                                        <label>Contraseña</label>
                                        <input type="password" class="form-control" name="password" placeholder="">
                                    </div>

                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input type="text" class="form-control" name="first_name" placeholder="">
                                    </div>

                                    <div class="form-group">
                                        <label>Apellido</label>
                                        <input type="text" class="form-control" name="last_name" placeholder="">
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Guardar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        
{% endblock %}