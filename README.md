# Trip Manager

A mobile-friendly web application to plan out your trip.

There are some great trip planner apps out there already, and I'm not trying to reinvent the wheel here. The main purpose for building this application is to learn while building. I'd like to use this application to plan out a near future trip to Japan.


---
## The Idea

A user can create a **trip**. All details for a given trip will be contained in this section. A user may have many trips planned/created.

For a given trip, a user can create **itinerary** items. Itinerary items may have the following details/features:
- Estimated or specific start and end dates.
- Different categories (e.g. flight details, hotel check-ins/outs, restaurant visits, events, tours, etc).
- Optional alerts. Alerts may need to be sent via email since this is a web app. Depending on difficulty, maybe allow user to export details of either the whole trip or an itinerary item to their Google calendar and have alerts setup there.

Additionally, a user can set **places of interest** either in some list or pins on a map. Places of interest are "extra" places that a user might like to visit. An itinerary item might allot a range of time at a certain location. Places of interest can be used as reference for things you might want to check out during that time there. Or maybe, you have extra time left over and you want to see what else you can do at a given location. Places of interest may have the following details/features:
- General details. Allow user to write anything they want about the place of interest.
- Category (e.g. food, event, sightsee location, etc).
- Importance flag (e.g. Things I feel I really want to see if time is available).
- Location (either address or pin on map). If I use a map, I could use current geolocation and show user closest places of interest.

For a given trip, a user can create **checklists**. These can be used for things like what to pack for the trip, things to prepare (e.g. phone card, train card, currency exchange, etc), souvenir ideas, etc. A checklist may have the following details/features:
- Ability to mark something done.
- Ability to add additional notes to a checklist item after marking it done. (e.g. I bought a souvenir for Dad, and I want to write down what the item was in the additional notes for reference).
- Title for checklist.

An **extra** section might be nice for general reference. This is definitely beyond MVP, but the idea is when a trip "starts", the extra section will show general details:
- Hourly weather of current location (adjustable by city you search).
- Total spent so far indicator (would require user to put in their expenses for each activity).
- Estimated expenses for rest of trip (would require user to put in estimated expenses for each activity).
- Total budget allocated for trip.
- Maybe an option to show time and date back home.


---
## Learning Goals

- REST API
- RPC API
- External APIs
- Rails
- React.js (maybe Next.js?)
- TypeScript
- GraphQL
- Pub/Sub (?)
- Search engine for possible locations (?)
- Security
- Testing
- Deployment


---
## MVP

- [ ] A User can register an account.
  - [ ] Using email and password. Add email confirmation.
  - [ ] Using Google OAuth.
- [ ] After logging in, a User will see an overview home page.
- [ ] A User can create a Trip.
  - [ ] A Trip has one or many Itinerary items.
  - [ ] A Trip has one or many Places of Interest items.
  - [ ] A Trip has one or many Checklist items.
  - [ ] A Trip should have essential details outlined: Location(s), Date range.
- [ ] A User can create an Itinerary item.
  - [ ] An Itinerary item is associated with a single Trip.
  - [ ] An Itinerary item should have either an estimated date, date range, or specific date.
  - [ ] An Itinerary item can be categorized (e.g. flight details, hotel check-in/out, restaurant reservations, events, tours, etc). ~Needs further thought~
- [ ] A User can create a Place of Interest item.
  - [ ] A User will need to put in general details for each Place of Interest, including name, type of attraction, address, etc.
  - [ ] Places of Interest can be shown as pins on a map.
  - [ ] Places of Interest can be shown as list items. Maybe sorted by distance from current location.
  - [ ] Places of Interest can be categorized (e.g. food, event, sightsee location, etc)
  - [ ] Place of Interest may be given an importance flag to indicate something a User would like to do if alloted the time.

**Beyond MVP**

- [ ] An Itinerary item can have alerts.
- [ ] Itinerary items or a single Itinerary item may be exported to Google calendar.
- [ ] An Itinerary item may have document attachments (e.g. tickets, reservations, etc).
- [ ] Use search engine to pre-fill Place of Interest details, including name and location.
- [ ] A User can create a Checklist item.
  - [ ] A User may have more than one Checklist item.
  - [ ] Each Checklist item should have a title.
  - [ ] Each Checklist item can be marked completed.
  - [ ] Each Checklist item can have final notes written after completion.
- [ ] A User can view an Extra section.
  - [ ] Display local weather information.
  - [ ] Allow user to search for weather information by city.
  - [ ] Estimated expenses for entire trip, and estimated expenses for remaining trip.
  - [ ] Total spent so far.
  - [ ] Total budget allocated for trip.
  - [ ] Show time and date locally and back home.


---
## Architecture

TODO


---
## UI Mock-ups

TODO


---
## Database Relations

TODO
