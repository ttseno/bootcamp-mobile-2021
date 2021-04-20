import React, {useState} from "react";
import {StyleSheet, SafeAreaView, View, Text, Button} from "react-native"
import {StatusBar} from 'expo-status-bar';


const HomeScreen = (props) => {
    [stateNome, setStateNome] = useState("");
    [stateSearchText, setSearchText] = useState("");

    return (
        <SafeAreaView style={styles.viewStyle}>
            <StatusBar style="auto" />
            <View>
               <Text>Series App</Text>
            </View>
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