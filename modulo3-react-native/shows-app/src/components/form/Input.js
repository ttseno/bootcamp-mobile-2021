import React, { useState } from "react"
import { StyleSheet, Text, TextInput } from "react-native"

const Input = (props) => {
    const [stateValue, setStateValue] = useState(props.initialValue);
    const onChange = (text) => {
        setStateValue(text);
        if (props.onChange)
            props.onChange(text)
    }
    return (
        <>
            <Text>{props.label}</Text>
            <TextInput 
                style = {styles.textInputStyle}
                value={stateValue} 
                onChangeText={onChange} 
            />
        </>
    )
}

export default Input;

const styles = StyleSheet.create({
    textInputStyle: {
        backgroundColor: "gray"
    }
})