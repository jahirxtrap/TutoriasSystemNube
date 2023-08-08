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
                                <h3 class="card-title">Dejar un comentario</h3>
                            </div>

                            {% comment %} Display Messages {% endcomment %}
                            {% include 'message.vue' %}
                                    
                            <form method="POST" action="{% url 'student_feedback_save' %}">
                                {% csrf_token %}

                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Comentario</label>
                                        <textarea name="feedback_message" class="form-control" rows="6" placeholder="Mensaje"></textarea>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Comentar</button>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-success">
                                <div class="card-header">
                                    <h3 class="card-title">Historial</h3>
                                </div>

                                <div class="card-body">
                                <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>#ID</th>
                                                <th>Mensaje</th>
                                                <th>Respuesta</th>
                                            </tr>
                                            </thead>
                                            {% for row in feedback_data %}
                                            <tr>
                                                <td>{{ row.id }}</td>
                                                <td>{{ row.feedback }}</td>
                                                <td>{{ row.feedback_reply }}</td>
                                            </tr>
                                            {% endfor %}
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

{% endblock content %}