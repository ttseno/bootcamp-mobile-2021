import React, {useState} from "react";
import {StyleSheet, SafeAreaView, Text, View} from "react-native"
import {StatusBar} from 'expo-status-bar';

import ShowList from "../components/list/ShowList";
import ShowDetail from "../components/detail/ShowDetail";


const ShowsScreen = () => {

    return (
        <SafeAreaView style={styles.viewStyle}>
            <StatusBar style="auto" />
            <View style={styles.listViewStyle}>
                <ShowList/>
            </View>
            <View style={styles.detailViewStyle}>
                <ShowDetail/>
            </View>
        </SafeAreaView>
    )
};

export default ShowsScreen;

const styles = StyleSheet.create({
    viewStyle:{
        flex:1
    },
    listViewStyle: {
        flex: 3,
        // backgroundColor: 'red',
        // alignItems: 'stretch',
    },
    detailViewStyle:{
        flex: 4,
        // alignItems: 'center',
        // justifyContent: 'center',
    }
})
