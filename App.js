import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, NativeModules } from 'react-native';

const { LiveActivity } = NativeModules;

const App = () => {

  const onStartActivity = () => {
    LiveActivity.startActivity();
  };

  const onEndActivity = () => {
    LiveActivity.endActivity();
  };

  const updateActivity = () => {
    LiveActivity.updateActivity('Updated Activity');
  };

  return (
    <>
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <TouchableOpacity style={[styles.itemContainer, { backgroundColor: '#0000ff50' }]} onPress={onStartActivity}>
          <Text>Start Activity</Text>
        </TouchableOpacity>

        <TouchableOpacity style={[styles.itemContainer, { backgroundColor: '#ffff0050' }]} onPress={updateActivity}>
          <Text>Update Activity</Text>
        </TouchableOpacity>

        <TouchableOpacity style={[styles.itemContainer, { backgroundColor: '#ff000050' }]} onPress={onEndActivity}>
          <Text>End Activity</Text>
        </TouchableOpacity>
      </View>
    </>
  );
};

const styles = StyleSheet.create({
  itemContainer: {
    marginVertical: 20,
    borderRadius: 10,
    paddingVertical: 20,
    width: '80%',
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default App;
