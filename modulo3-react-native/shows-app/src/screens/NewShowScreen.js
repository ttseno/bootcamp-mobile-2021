import React from "react"
import {StyleSheet, SafeAreaView, Text} from "react-native"

const NewShowScreen = () => {
    return ( 
        <SafeAreaView style={styles.viewStyle}>
            <Text>New show screen</Text>
        </SafeAreaView>
    )
}

export default NewShowScreen;

const styles = StyleSheet.create({
    viewStyle: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    }    
})
