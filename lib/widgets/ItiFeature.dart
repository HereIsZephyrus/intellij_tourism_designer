import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:intellij_tourism_designer/constants/Themes.dart';
import 'package:intellij_tourism_designer/constants/location.dart';

class ItiFeature extends StatefulWidget {
  const ItiFeature({super.key});

  @override
  State<ItiFeature> createState() => _ItiFeatureState();
}

class _ItiFeatureState extends State<ItiFeature> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(height:120, child:_customizeDayAppearanceExample()),
        SizedBox(height:5),
        TextButton(
          onPressed:(){},
          child:Text("确定"),
          style:AppButton.button1
        ),
        Container(height:120, child:_customizeDayAppearanceExample()),
        SizedBox(height:5),
        TextButton(
            onPressed:(){},
            child:Text("确定"),
            style:AppButton.button1
        ),
        SizedBox(height:20),
        Container(
          height:90,
          color:AppColors1.primaryColor,
          child:Column(
            children:[
              Text("a"),
              Row(
                children:[
                  TextButton(
                      onPressed:(){},
                      child:Text("??"),
                      style:AppButton.button2
                  ),
                  TextButton(
                      onPressed:(){},
                      child:Text("??"),
                      style:AppButton.button2
                  ),
                  TextButton(
                      onPressed:(){},
                      child:Text("??"),
                      style:AppButton.button2
                  ),
                ]
              )
            ]
          )
        ),
        Container(
            height:90,
            color:AppColors1.primaryColor,
            child:Column(
                children:[
                  Text("b"),
                  Row(
                      children:[
                        TextButton(
                            onPressed:(){},
                            child:Text("??"),
                            style:AppButton.button2
                        ),
                        TextButton(
                            onPressed:(){},
                            child:Text("??"),
                            style:AppButton.button2
                        ),
                        TextButton(
                            onPressed:(){},
                            child:Text("??"),
                            style:AppButton.button2
                        ),
                      ]
                  )
                ]
            )
        ),
        Container(
            height:90,
            color:AppColors1.primaryColor,
            child:Column(
                children:[
                  Text("c"),
                  Row(
                      children:[
                        TextButton(
                            onPressed:(){},
                            child:Text("??"),
                            style:AppButton.button2
                        ),
                        TextButton(
                            onPressed:(){},
                            child:Text("??"),
                            style:AppButton.button2
                        ),
                        TextButton(
                            onPressed:(){},
                            child:Text("??"),
                            style:AppButton.button2
                        ),
                      ]
                  )
                ]
            )
        )
      ]
    );
  }
}

EasyDateTimeLine _customizeDayAppearanceExample() {
  return EasyDateTimeLine(
    initialDate: DateTime.now(),
    onDateChange: (selectedDate) {
      //`selectedDate` the new date selected.
    },
    dayProps: const EasyDayProps(
      height: 56.0,
      // You must specify the width in this case.
      width: 124.0,
    ),
    headerProps: const EasyHeaderProps(
      dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
    ),
    itemBuilder: (BuildContext context, String dayNumber, dayName, monthName,
        fullDate, isSelected) {
      return Container(
        //the same width that provided previously.
        width: 124.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors1.primaryColor : null,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              monthName,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors1.backgroundColor:AppColors1.textColor,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              dayNumber,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors1.backgroundColor:AppColors1.textColor,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              dayName,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors1.backgroundColor:AppColors1.textColor,
              ),
            ),
          ],
        ),
      );
    },
  );
}
