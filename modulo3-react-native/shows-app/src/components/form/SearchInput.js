import React, { useState } from 'react'
import { StyleSheet, View, Text, TextInput} from 'react-native'
import { AntDesign } from '@expo/vector-icons';
import Input from '../form/Input'

const SearchInput = (props) => {
    const [stateValue, setStateValue] = useState(props.initialValue);
    const onChange = (text) => {
        setStateValue(text);
        if (props.onChange)
            props.onChange(text)
    }
    return (
        <>
            <View style={styles.viewStyle}>
                <AntDesign name="search1" size={24} color="black" />
                <TextInput
                    value={stateValue}
                    onChangeText={onChange}
                />
            </View>
        </>
    )
}

export default SearchInput;

const styles = StyleSheet.create({
    viewStyle: {
        flexDirection:"row",
        backgroundColor: "gray",
        borderRadius: 50
    },
    textInputStyle: {
        marginLeft: 5
    }
})