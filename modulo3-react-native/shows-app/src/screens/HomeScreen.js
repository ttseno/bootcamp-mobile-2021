import React, {useState} from "react";
import {StyleSheet, SafeAreaView, Text, Button} from "react-native"
import {StatusBar} from 'expo-status-bar';

import Input from '../components/form/Input'
import SearchInput from '../components/form/SearchInput' 

const HomeScreen = (props) => {
    [stateNome, setStateNome] = useState("");
    [stateSearchText, setSearchText] = useState("");

    return (
        <SafeAreaView style={styles.viewStyle}>
            <StatusBar style="auto" />
            <Text>Home screen</Text>
        </SafeAreaView>
    )
};

export default HomeScreen;

const styles = StyleSheet.create({
    viewStyle: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    }    
})