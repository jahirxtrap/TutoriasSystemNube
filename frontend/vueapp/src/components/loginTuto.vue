<template>
    <div class="login-box">
        <div class="login-logo">
            <a href="{% url 'login' %}"><b>Sistema </b>Gestion Tutorias</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body"
                style="margin-left: 5%; margin-right: 5%; margin-top: 5%; margin-bottom: 5%;">
                {% comment %} Display Messages {% endcomment %}
                {% include 'message.vue' %}  
                <h3 class="login-box-msg">Iniciar sesión en preproducción</h3>

                <form action="{% url 'doLogin' %}" method="POST">
                    {% csrf_token %}
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" placeholder="Correo" name="email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Contraseña" name="password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <div>
                        <button type="submit" class="btn btn-primary btn-block">Ingresar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>