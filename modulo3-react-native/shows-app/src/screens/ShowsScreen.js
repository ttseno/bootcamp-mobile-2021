import React, {useState} from "react";
import {StyleSheet, SafeAreaView, Text} from "react-native"
import {StatusBar} from 'expo-status-bar';


const ShowsScreen = () => {

    return (
        <SafeAreaView style={styles.viewStyle}>
            <StatusBar style="auto" />

            <Text>Shows screen</Text>
        </SafeAreaView>
    )
};

export default ShowsScreen;

const styles = StyleSheet.create({
    viewStyle: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    }    
})