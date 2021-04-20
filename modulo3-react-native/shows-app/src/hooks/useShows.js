import { useContext, useEffect } from 'react';
import shows from '../api/shows';
import { AppContext } from '../context/AppContext';

export const useShows = () => {
    const {state, dispatch} = useContext(AppContext);

    useEffect(()=>{
        shows.get('/shows')
             .then(response => {
                 const action = {type: "createShowList", payload: response.data}
                 dispatch(action);
            })
    },[]);

    return {showList:state.showList};
}