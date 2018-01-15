import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';
import middleware from '../middleware/thunk';

const configureStore = () => createStore(rootReducer, applyMiddleware(middleware, logger));

export default configureStore;
