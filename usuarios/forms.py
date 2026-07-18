from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import Usuario

class RegistroForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = ['username','first_name', 'last_name', 'documento','email', 'password1', 'password2', ]

class LoginForm(AuthenticationForm):
    # No hace falta Meta
    pass