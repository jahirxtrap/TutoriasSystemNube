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
                        <h3 class="card-title">Actualizar Perfil</h3>
                    </div>

                    <form role="form" method="POST" action="{% url 'admin_profile_update' %}">
                        {% csrf_token %}
                        {% comment %} Display Messages {% endcomment %}
                        {% include 'message.vue' %}

                        <div class="card-body">
                            <div class="form-group">
                                <label>Usuario </label>
                                <input type="text" class="form-control" name="username" value="{{ user.username }}" disabled="disabled">
                            </div>

                            <div class="form-group">
                                <label>Correo </label>
                                <input type="text" class="form-control" name="email" value="{{ user.email }}" disabled="disabled">
                            </div>

                            <div class="form-group">
                                <label>Nombre </label>
                                <input type="text" class="form-control" name="first_name" value="{{ user.first_name }}">
                            </div>

                            <div class="form-group">
                                <label>Apellido </label>
                                <input type="text" class="form-control" name="last_name" value="{{ user.last_name }}">
                            </div>

                            <div class="form-group">
                                <label>Contraseña </label>
                                <input type="text" class="form-control" name="password" placeholder="Complete solo si desea cambiar la contraseña.">
                            </div>
                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary">Actualizar Perfil</button>
                        </div>
                    </form>
                </div>

  {% endblock content %}