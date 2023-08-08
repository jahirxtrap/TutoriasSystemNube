<div class="nav-left-sidebar sidebar-dark">
    <div class="menu-list">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="">Panel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="nav nav-pills nav-sidebar flex-column">
                    <li class="nav-divider">Menu</li>

                    <li class="nav-item">
                        {% url 'staff_take_attendance' as staff_take_attendance %}
                        <a href="{{ staff_take_attendance }}" class="nav-link {% if request.path == staff_take_attendance %} active {% endif %}">
                            <span class="fa fa-fw fa-calendar-plus"></span>&nbsp&nbsp&nbspTomar asistencia
                        </a>
                    </li>

                    <li class="nav-item">
                        {% url 'staff_update_attendance' as staff_update_attendance %}
                        <a href="{{ staff_update_attendance }}" class="nav-link {% if request.path == staff_update_attendance %} active {% endif %}">
                            <span class="fa fa-fw fa-calendar-alt"></span>&nbsp&nbsp&nbspVer Actualización de Asistencia
                        </a>
                    </li>

                    <li class="nav-item">
                        {% url 'staff_add_result' as staff_add_result %}
                        <a href="{{ staff_add_result }}" class="nav-link {% if request.path == staff_add_result %} active {% endif %}">
                            <span class="fa fa-fw fa-tasks"></span>&nbsp&nbsp&nbspAgregar Resultado
                        </a>
                    </li>

                    <li class="nav-item">
                        {% url 'staff_apply_leave' as staff_apply_leave %}
                        <a href="{{ staff_apply_leave }}" class="nav-link {% if request.path == staff_apply_leave %} active {% endif %}">
                            <span class="fa fa-fw fa-envelope-open"></span>&nbsp&nbsp&nbspSolicitar baja
                        </a>
                    </li>

                    <li class="nav-item">
                        {% url 'staff_feedback' as staff_feedback %}
                        <a href="{{ staff_feedback }}" class="nav-link {% if request.path == staff_feedback %} active {% endif %}">
                            <span class="fa fa-fw fa-comments"></span>&nbsp&nbsp&nbspComentario
                        </a>
					</li>
                </ul>
            </div>
        </nav>
    </div>
</div>