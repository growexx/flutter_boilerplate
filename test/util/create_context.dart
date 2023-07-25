


import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';

BuildContext createContext(BuildContext mockBuildContext){
  final context = mockBuildContext;
  const mediaQuery = MediaQuery(
    data: MediaQueryData(),
    child: SizedBox(),
  );
  when(context.widget).thenReturn(const SizedBox());
  when(context.findAncestorWidgetOfExactType()).thenReturn(mediaQuery);
  when(context.dependOnInheritedWidgetOfExactType<MediaQuery>())
      .thenReturn(mediaQuery);
  when(context.getElementForInheritedWidgetOfExactType())
      .thenReturn(InheritedElement(mediaQuery));
  return context;
}