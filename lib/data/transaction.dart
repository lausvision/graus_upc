
/*
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

void trans(){

const db= firebase.firestore();

const increment = firebase.firestore.FieldValue.increment(1);

const statsRef = db.collection('grau')
const storyRef = db.collection('stories').doc('${Math.random()}')

const batch = db.batch();
batch.set (storyRef, {title:'New one!'});
batch.set (statsRef, { storyCount:increment}, {merge:true});
batch.commit();

}
*/