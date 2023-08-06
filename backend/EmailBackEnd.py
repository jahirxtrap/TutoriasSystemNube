from django.contrib.auth import get_user_model
from django.contrib.auth.backends import ModelBackend

# Clase que implementa un backend de autenticación personalizado en Django.
# Permite a los usuarios iniciar sesión con su dirección de correo electrónico en lugar de un nombre de usuario.
class EmailBackEnd(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        UserModel = get_user_model()
        try:
            user = UserModel.objects.get(email=username)
        except UserModel.DoesNotExist:
            return None
        else:
            if user.check_password(password):
                return user
        return None