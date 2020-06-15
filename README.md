# MakersAirBnB

## High Level Goal
- Create an AirBnB clone that allows uses to list spaces they have available and book spaces for the night.

## Headline Spec 
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories
```
As a user, 
so that I can sign-in,
I would like to be able to sign-up

As a user, 
so that I can sign-in,
I would like to be able to sign-in

As a property owner, 
so that other people can view my space,
I would like to be able list a space

As a property owner, 
so that other people can find my space,
I would like to be able to name my space 

As a property owner, 
so that other people can find my space,
I would like to be able to describe my space 

As a property owner, 
so that other people can find my space,
I would like to be able to show the price per night for my space 

As a property owner, 
so that other people can see when my space is available,
I would like to be able to show a range of available dates

As a holiday maker, 
so that I can see if a space is available when I want,
I would like to be able to see a range of dates when a space is of available

As a property owner,
so that I avoid double-booking
I would like the date range to show when a propert is already booked

As a holiday maker, 
so that I can book a space,
I would like to be able to book a property

As a property owner,
so that I can control who books my property,
I would like to be able to confirm before booking

As a propert owner 
so that I can choose between multiple booking requests,
My property should remain avialable until I've confirmed a request. 

As a property owner, 
so that that I make loads of money,
I would like to be able to list multiple spaces

As a holiday maker, 
so that I can choose a space to book,
I would like to be able to view all spaces
```



## Nice-to-haves
- Users should receive an email whenever one of the following happens:
- They sign up
- They create a space
- They update a space
- A user requests to book their space
- They confirm a request
- They request to book a space
- Their request to book a space is confirmed
- Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
- A user requests to book their space
- Their request to book a space is confirmed
- Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.
