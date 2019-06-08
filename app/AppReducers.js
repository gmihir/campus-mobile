import { combineReducers } from 'redux'

import cardsReducer from './reducers/cardsReducer'
import diningReducer from './reducers/diningReducer'
import eventsReducer from './reducers/eventsReducer'
import feedbackReducer from './reducers/feedbackReducer'
import homeReducer from './reducers/homeReducer'
import linksReducer from './reducers/linksReducer'
import locationReducer from './reducers/locationReducer'
import mapReducer from './reducers/mapReducer'
import messagesReducer from './reducers/messagesReducer'
import newsReducer from './reducers/newsReducer'
import parkingReducer from './reducers/parkingReducer'
import requestErrorsReducer from './reducers/requestErrorsReducer'
import requestStatusesReducer from './reducers/requestStatusesReducer'
import routesReducer from './reducers/routesReducer'
import scheduleReducer from './reducers/scheduleReducer'
import shuttleReducer from './reducers/shuttleReducer'
import specialEventsReducer from './reducers/specialEventsReducer'
import studentProfileReducer from './reducers/studentProfileReducer'
import supplementalInstructionReducer from './reducers/supplementalInstructionReducer'
import surfReducer from './reducers/surfReducer'
import userReducer from './reducers/userReducer'
import weatherReducer from './reducers/weatherReducer'

module.exports = combineReducers({
	cards: cardsReducer,
	dining: diningReducer,
	events: eventsReducer,
	feedback: feedbackReducer,
	home: homeReducer,
	links: linksReducer,
	location: locationReducer,
	map: mapReducer,
	messages: messagesReducer,
	news: newsReducer,
	parking: parkingReducer,
	requestErrors: requestErrorsReducer,
	requestStatuses: requestStatusesReducer,
	routes: routesReducer,
	schedule: scheduleReducer,
	shuttle: shuttleReducer,
	specialEvents: specialEventsReducer,
	studentProfile: studentProfileReducer,
	supplementalInstruction: supplementalInstructionReducer,
	surf: surfReducer,
	user: userReducer,
	weather: weatherReducer,
})
