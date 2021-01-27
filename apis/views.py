from rest_framework.decorators import api_view,renderer_classes
from django.db import transaction
from apis.models import *
from apis.serializers import *
from rest_framework.response import Response
from rest_framework import status
import json
from django.core.mail import EmailMessage
import traceback
import base64 
from django.db import connection
from django.conf import settings    
import base64, random, pytz
import datetime
from datetime import datetime, timedelta
from django.utils import timezone
from pytz import timezone
from django.utils import timezone
from django.http import JsonResponse
import time
import uuid 



#========================================
# API for make reservations
#========================================

@api_view(['POST'])
def movie_search(request):
    try:
        with transaction.atomic():
            searchitem = request.data['searchitem']
            if searchitem:

                movies = Movie.objects.filter(name__icontains = request.data['searchitem'])
                if movies:
                    movie_serializer = MovieSerializer(movies,many=True).data
                    return Response({'search':movie_serializer,}, status=status.HTTP_200_OK)
                else:
                    return Response({"message" : "not found"},  status=status.HTTP_200_OK)
            else:
                return Response({"message" : "not found","search":[]},  status=status.HTTP_200_OK)
                   
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "something went wrong!", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

#========================================
# API for cinema halls
#========================================

@api_view(['POST'])
def cinema_hall_list(request):
    try:
        with transaction.atomic():
            movie_hall = Cinema_Hall_Movies.objects.filter(movie = request.data['movie_id']).values('cinema_halls')
            if movie_hall:
                halllist = Cinema_Halls.objects.filter(id__in = movie_hall)
                if halllist:
                    listserial = CinemaHallSerializer(halllist,many=True).data
                    return Response({"message" : "sucessfully get","response" : listserial,"movie_id" : int(request.data['movie_id'])},  status=status.HTTP_200_OK)
                else:
                    return Response({"message" : "No result fount","response" : []},  status=status.HTTP_200_OK)
            else:
                return Response({"message" : "No result fount","response" : []},  status=status.HTTP_200_OK)
                   
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "something went wrong!", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


#============================================
# API for cinema halls screens based movies
#============================================

@api_view(['POST'])
def cinema_hall_screens_list(request):
    try:
        with transaction.atomic():
            movie_hall_screens = Screens.objects.filter(cinema_halls = request.data['cinema_halls_id']).values('id')
            if movie_hall_screens:
                screenlist = MovieScreens.objects.filter(screens__in = movie_hall_screens,movie = request.data['movie_id'])
                if screenlist:
                    listserial = MovieScreenSerializer(screenlist,many=True).data
                    for data in listserial:
                        screenstime = MovieScreenTime.objects.filter(movie_screens = data['id'])
                        data['timmings']= MovieScreenTimeSerializer(screenstime,many=True).data
                    return Response({"message" : "sucessfully get","response" : listserial},  status=status.HTTP_200_OK)
                else:
                    return Response({"message" : "No result fount","response" : []},  status=status.HTTP_200_OK)
            else:
                return Response({"message" : "No result fount","response" : []},  status=status.HTTP_200_OK)
                   
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "something went wrong!", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

import pdb
#============================================
#  booking
#============================================

@api_view(['POST'])
def booking(request):
    try:
        with transaction.atomic():
            seats_booking = int(request.data['seats_booking'])
            available_seat = MovieScreenTime.objects.get(id=request.data['MovieScreenTime_id']).available_seats
            seat_left = available_seat-seats_booking
            if available_seat >=seats_booking:
                
                user = User.objects.create(
                    username = uuid.uuid4().hex[:6].upper(),
                    email= request.data['email'],
                    phone_no = request.data['phone'],
                    first_name = request.data['first_name'],
                    last_name = request.data['last_name']
                )
                

                bookingid = Bookings.objects.create(
                    user = user,
                    movie_screens = MovieScreens.objects.get(id = request.data['movie_screens_id']),
                    movie_screen_time = MovieScreenTime.objects.get(id = request.data['MovieScreenTime_id'])

                )
                MovieScreenTime.objects.filter(id=request.data['MovieScreenTime_id']).update(available_seats = seat_left)
                Screens.objects.filter(id=request.data['screen_id']).update(seats = seat_left)
                movie_id = MovieScreens.objects.filter(id= request.data['movie_screens_id']).values('movie')
                movie = Movie.objects.get(id__in=movie_id)

                hall_id = Screens.objects.filter(id = request.data['screen_id']).values('cinema_halls')
                hall = Cinema_Halls.objects.get(id__in=hall_id)
                            
                screen = Screens.objects.get(id = request.data['screen_id'])
                
                time = MovieScreenTime.objects.get(id = request.data['MovieScreenTime_id'])
            

                list = []
                list.append(request.data['email'])
                try:
                    subject = "Booking Details"

                    email_body = """\
                        <html>
                            <head></head>
                            <body>
                                <h2>Dear %s, </h2>
                                <p> Thanks for the booking,
                                Here is your booking details:</p>
                                <p>Booking ID: %s</p>
                                <p>Movie: %s</p>
                                <p>Cinema Hall: %s</p>
                                <p>Screen No: %s</p>
                                <p>Booked Seats: %s</p>
                                <p>Show Timmings: %s to %s</p>
                                <p>Team BookMyShow
                                </p>
                            </body>
                        </html>
                        """ %(request.data['first_name'],bookingid.bookingId,movie.name,hall.name,screen.number,seats_booking,time.from_time,time.to_time)
                    email = EmailMessage('Booking Details', email_body, to=list)
                    email.content_subtype = "html"
                    response = email.send()
                    return Response({"message" : "booking successfully completed"},  status=status.HTTP_200_OK)
                except Exception:
                    print(traceback.format_exc())
                    return Response({"message" : "something went wrong!", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                    
            return Response({"message" : "only"+seat_left+"seats left", "status" : "0"}, status=status.HTTP_400_BAD_REQUEST)      
            
            
              
    except Exception:
        print(traceback.format_exc())
        return Response({"message" : "something went wrong!", "status" : "0"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
