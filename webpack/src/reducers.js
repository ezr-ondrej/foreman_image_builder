import { combineReducers } from 'redux';
import EmptyStateReducer from './Components/EmptyState/EmptyStateReducer';

const reducers = {
  foremanImageBuilder: combineReducers({
    emptyState: EmptyStateReducer,
  }),
};

export default reducers;
