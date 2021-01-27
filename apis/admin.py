from django.contrib import admin
from .models import * 

admin.site.register(User)
admin.site.register(Movie)
admin.site.register(Cinema_Halls)
admin.site.register(Cinema_Hall_Movies)
admin.site.register(Screens)
admin.site.register(MovieScreens)
admin.site.register(MovieScreenTime)
admin.site.register(Bookings)
# Register your models here.
