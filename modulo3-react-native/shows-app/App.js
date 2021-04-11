import React from "react"
import { NavigationContainer } from "@react-navigation/native"
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs"
import { StyleSheet, SafeAreaView, TouchableOpacity } from "react-native"

import { AntDesign } from '@expo/vector-icons';
import { Feather } from '@expo/vector-icons';
import { Ionicons } from '@expo/vector-icons';

import HomeScreen from "./src/screens/HomeScreen"
import ShowsScreen from "./src/screens/ShowsScreen"
import NewShowScreen from "./src/screens/NewShowScreen"


const tabBarStyles = StyleSheet.create({
  viewStyle:{
    flexDirection: "row",
    justifyContent: "space-around"
  }
})

const TabBar = ({navigation}) => {
  return (
    <SafeAreaView style ={tabBarStyles.viewStyle} >
    <>
      <TouchableOpacity onPress={()=>navigation.navigate("Home")}>
        <AntDesign name="home" size={30} color="black" />
      </TouchableOpacity>
      <TouchableOpacity  onPress={()=>navigation.navigate("Shows")}>
        <Feather name="list" size={30} color="black" />
      </TouchableOpacity>
      <TouchableOpacity  onPress={()=>navigation.navigate("New")}>
      <Ionicons name="md-add-sharp" size={30} color="black" />
      </TouchableOpacity>
    </>
  </SafeAreaView>
  )
}

export default function App() {
  const TabNav = createBottomTabNavigator();
  
  return (
    <NavigationContainer>
      <TabNav.Navigator tabBar={props => <TabBar {...props}/>}>
        <TabNav.Screen name="Home" component={HomeScreen} />
        <TabNav.Screen name="Shows" component={ShowsScreen} />
        <TabNav.Screen name="New" component={NewShowScreen} />
      </TabNav.Navigator>
    </NavigationContainer>
  );
}
