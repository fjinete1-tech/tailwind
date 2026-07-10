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