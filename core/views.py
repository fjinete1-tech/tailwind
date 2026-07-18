from django.shortcuts import render
from django.views.generic import View

class HomeView(View):
    def get(self, request, *args, **kwargs):
        context = {
            'title': 'Home Page',
            'content': 'Welcome to the Home Page!'
        }
        return render(request, 'index.html', context)
    
class AboutView(View):
    def get(self, request, *args, **kwargs):
        context = {
            'title': 'About Page',
            'content': 'Welcome to the About Page!'
        }
        return render(request, 'about.html', context)

class ContactView(View):
    def get(self, request, *args, **kwargs):
        context = {
            'title': 'Contact Page',
            'content': 'Welcome to the Contact Page!'
        }
        return render(request, 'contact.html', context)
    
#class LoginView(View):
    #def get(self, request, *args, **kwargs):
        #context = {
            #'title': 'Login Page',
            #'content': 'Welcome to the Login Page!'
        #}
        #return render(request, 'usuarios/login.html', context)
    
#class RegistroView(View):
    #def get(self, request, *args, **kwargs):
        #context = {
            #'title': 'Registro Page',
            #'content': 'Welcome to the Registro Page!'
        #}
        #return render(request, 'registro.html', context)