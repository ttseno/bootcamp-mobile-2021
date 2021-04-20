import React, { useContext} from 'react'
import {StyleSheet, FlatList, Text, TouchableOpacity, View} from 'react-native'
import { AppContext } from '../../context/AppContext';

import {useShows} from '../../hooks/useShows'


const ShowList = () => {
    const {showList} = useShows();
    const {dispatch} = useContext(AppContext);

    return (
        <>
        <View style={styles.listStyle}>
            <FlatList
                data={showList.sort((a,b)=>(""+a.name).localeCompare(b.name))}
                keyExtractor={(item)=>item.id}
                renderItem={({item})=>
                        <TouchableOpacity
                            onPress={()=> dispatch({type: "setSelectedItem", payload: item})}                            
                        >
                            <View style={styles.itemStyle}>
                                <Text>{item.name}</Text>
                            </View>
                        </TouchableOpacity>
                    }
                />
        </View>
        </>
    )
}

export default ShowList;

const styles = StyleSheet.create({
    listStyle:{
        marginTop: 50,
        alignItems:"stretch"
    },
    itemStyle:{
        flexDirection: "row",
        justifyContent: "center",
        alignContent:"stretch",
        borderTopWidth: 1,
        borderBottomWidth: 1,
        borderColor: "gray",
        backgroundColor:"#DCDCDC"
    }
})