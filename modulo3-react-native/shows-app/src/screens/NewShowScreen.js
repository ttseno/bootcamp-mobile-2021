import React, { useContext, useState } from "react"
import {StyleSheet, View, Text, Button} from "react-native"
import Input from "../components/form/Input";
import { AppContext } from "../context/AppContext";

const NewShowScreen = () => {
    const {dispatch} = useContext(AppContext);
    const [nameState, setNameState] = useState("");
    const [networdState, setNetworkState] = useState("");
    const [startDateState, setStartDateState] = useState("");
    const [imageState, setImageState] = useState("");

    const save = () => {
        const action = {
            type: "addItem",
            payload: {
                name: nameState,
                network: networdState,
                start_date: startDateState,
                image_thumbnail_path: imageState
            }
        };
        setNameState("");
        setNetworkState("");
        setStartDateState("");
        setImageState("");
        console.info(action);
        dispatch(action);
    }

        

    return ( 
        <View style={styles.viewStyle}>
            <Input label={"Name"} onChange={(text)=> setNameState(text)} />
            <Input label={"Network"} onChange={(text)=> setNetworkState(text)} />
            <Input label={"Start date"} onChange={(text)=> setStartDateState(text)} />
            <Input label={"Image"} onChange={(text)=> setImageState(text)} />

            <Button title={"Save"} onPress={()=>save()}/>
        </View>
    )
}

export default NewShowScreen;

const styles = StyleSheet.create({
    viewStyle: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'stretch',
        alignContent:"stretch",
        justifyContent: 'center',
    }    
})
