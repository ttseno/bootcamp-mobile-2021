import React, { useContext } from 'react'
import {StyleSheet, Text, Image, View} from 'react-native'

import { AppContext } from '../../context/AppContext'


const ShowDetail = () => {
    const {state} = useContext(AppContext);
    const show = state.selectedItem

    if(show != null) {
        return(
            <>
            <View style={styles.viewStyle}>
                    <Image 
                        style={styles.imageStyle}
                        source={{uri: show.image_thumbnail_path}}
                    />
                    <View style={styles.detailStyle}>
                        <View style={styles.detailTextStyle}>
                            <Text style={styles.titleStyle}>Name: </Text>
                            <Text>{show.name}</Text>
                        </View>
                        <View style={styles.detailTextStyle}>
                            <Text style={styles.titleStyle}>Network: </Text>
                            <Text>{show.network}</Text>
                        </View>
                        <View style={styles.detailTextStyle}>
                            <Text style={styles.titleStyle}>Start Date: </Text>
                            <Text>{show.start_date}</Text>
                        </View>
                    </View>
            </View>
            </>
        )
    } else {
        return (<></>)
    }
}

export default ShowDetail;

const styles = StyleSheet.create({
    viewStyle: {
        flexDirection: "row"
    },
    imageStyle:{
        height: 200,
        width:150
    },
    detailStyle: {
        marginTop: 50,
        marginLeft: 15
    },
    detailTextStyle: {
        flexDirection: "row"
    },
    titleStyle: {
        fontWeight: "bold"
    }
});