from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import render, redirect
from django.urls import reverse


class LoginCheckMiddleWare(MiddlewareMixin):
    
    def process_view(self, request, view_func, view_args, view_kwargs):
        modulename = view_func.__module__
        user = request.user

        # #Comprobar si el usuario ha iniciado sesión o no
        #     if user.is_authenticated:
        #         if user.user_type == "1":
        #             if modulename == "backend.HodViews":
        #                 pass
        #             elif modulename == "backend.views" or modulename == "django.views.static":
        #                 pass
        #             else:
        #                 return redirect("ttt")
                
        #         elif user.user_type == "2":
        #             if modulename == "backend.StaffViews":
        #                 pass
        #             elif modulename == "backend.views" or modulename == "django.views.static":
        #                 pass
        #             else:
        #                 return redirect("ttt")
                
        #         elif user.user_type == "3":
        #             if modulename == "backend.StudentViews":
        #                 pass
        #             elif modulename == "backend.views" or modulename == "django.views.static":
        #                 pass
        #             else:
        #                 return redirect("ttt")

        #         else:
        #             return redirect("ttt")

        #     else:
        #         if request.path == reverse("login") or request.path == reverse("doLogin"):
        #             pass
        #         else:
        #             return redirect("login")
