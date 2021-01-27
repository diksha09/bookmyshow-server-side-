from django.db import models
from django.contrib.auth.models import AbstractUser
import datetime
from django.utils.timezone import utc
import uuid
from django.utils import timezone
from time import strptime
from django.utils.translation import ugettext, ugettext_lazy as _


class User(AbstractUser):
    
    pass
    id = models.BigAutoField(primary_key = True)
    phone_no =  models.CharField(max_length=20, default="")
    
    class Meta:
        verbose_name = ('auth_user')
        verbose_name_plural = ('auth_users')
        db_table = 'auth_user'

class Movie(models.Model):
    id = models.BigAutoField(primary_key = True)
    name = models.CharField(max_length = 200,default="")
    status = models.IntegerField(default = 1)

    class Meta:
        verbose_name = ('movie')
        verbose_name_plural = ('movies')
        db_table = 'movie'

class Cinema_Halls(models.Model):
    id = models.BigAutoField(primary_key = True)
    name = models.CharField(max_length = 200,default="")
    status = models.IntegerField(default = 1)


    class Meta:
        verbose_name = ('cinemahall')
        verbose_name_plural = ('cinemahalls')
        db_table = 'cinemahall'

class Cinema_Hall_Movies(models.Model):
    id = models.BigAutoField(primary_key = True)
    cinema_halls = models.ForeignKey(Cinema_Halls, on_delete= models.CASCADE, null="True")
    movie = models.ForeignKey(Movie, on_delete = models.CASCADE, null = "True")
    status = models.IntegerField(default = 1)


    class Meta:
        verbose_name = ('cinemahallmovies')
        verbose_name_plural = ('cinemahallmovieses')
        db_table = 'cinemahallmovies'

class Screens(models.Model):
    id = models.BigAutoField(primary_key = True)
    number = models.IntegerField()
    seats = models.IntegerField(default = 50)
    cinema_halls = models.ForeignKey(Cinema_Halls, on_delete = models.CASCADE, null = "True")
    status = models.IntegerField(default = 1)

    class Meta:
        verbose_name = ('screens')
        verbose_name_plural = ('screenses')
        db_table = 'screens'

class MovieScreens(models.Model):
    id = models.BigAutoField(primary_key = True)
    movie = models.ForeignKey(Movie, on_delete = models.CASCADE, null = "True")
    screens = models.ForeignKey(Screens, on_delete = models.CASCADE, null ="True")
    status = models.IntegerField(default = 1)

    class Meta:
        verbose_name = ('moviescreens')
        verbose_name_plural = ('moviescreenses')
        db_table = 'moviescreens'

class MovieScreenTime(models.Model):
    id = models.BigAutoField(primary_key = True)
    available_seats = models.IntegerField()
    from_time = models.DateTimeField()
    to_time = models.DateTimeField()
    movie_screens = models.ForeignKey(MovieScreens, on_delete = models.CASCADE, null = "True")
    status = models.IntegerField(default = 1)

    class Meta:
        verbose_name = ('moviescreentime')
        verbose_name_plural = ('moviescreentimes')
        db_table = 'moviescreentime'

class Bookings(models.Model):
    id = models.BigAutoField(primary_key = True)
    bookingId = models.UUIDField(default = uuid.uuid4,editable = False)
    user = models.ForeignKey(User, on_delete = models.CASCADE, null = "True")
    movie_screens = models.ForeignKey(MovieScreens, on_delete = models.CASCADE, null ="True")
    movie_screen_time = models.ForeignKey(MovieScreenTime, on_delete = models.CASCADE, null ="True")
    status = models.IntegerField(default = 1)

    class Meta:
        verbose_name = ('booking')
        verbose_name_plural = ('bookings')
        db_table = 'booking'
