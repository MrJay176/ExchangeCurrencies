import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:ogbonge/MyScreens/Apartments.dart';
import 'package:ogbonge/Utils/loader.dart';
import 'package:ogbonge/Widgets/SearchCard.dart';

class SearchScreen extends StatefulWidget {

   SearchScreen({
     this.type,
     Key key,
   }) : super(key:key);

   final String type;
   var still_loading = true;

  @override
  _SearchScreenState createState()=>_SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {

  AnimationController controller2;
  Animation<Color> animation_color;
  Color initialColor = Colors.deepOrange[900];

  Size size;

   //History Length
   static const historyLength = 5;

   //Show All The History When User Clicks On Search
   List<String> _searchHistory = [
      "Uyo",
      "Oron",
      "Ewet Housing",
      "Itiam",
      "nwaniba road"
   ];

   //Show Filtered Result While User Starts Typing
   List<String> filteredSearchHistory;

   String selectedTerm;

   List<String> filterSearchTerms({@required String filter}){
      if(filter!=null && filter.isNotEmpty){
         return _searchHistory.reversed.where((term) =>term.startsWith(filter)).toList();
      }else {
         return _searchHistory.reversed.toList();
      }
   }

   bool isClicked = false;

   void addSearchTerm(String term){
     if(_searchHistory.contains(term)){
        putSearchTermFirst(term);
        return;
     }

     _searchHistory.add(term);
     if(_searchHistory.length >historyLength){
       _searchHistory.removeRange(0,_searchHistory.length - historyLength);
     }

     filteredSearchHistory = filterSearchTerms(filter: null);
   }

   void deleteSearchTerm(String term){
     _searchHistory.removeWhere((element) => element == term);
     filteredSearchHistory = filterSearchTerms(filter: null);
   }


   void putSearchTermFirst(String term){
      deleteSearchTerm(term);
      addSearchTerm(term);
   }

   FloatingSearchBarController controller;
   var content = "App";

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller2=AnimationController(vsync:this,duration:Duration(seconds:2));
    animation_color=ColorTween(
      begin:Colors.deepOrange[900],
      end:Colors.orange[700],
    ).animate(CurvedAnimation(parent:controller2,curve:Curves.bounceOut));

    filteredSearchHistory = filterSearchTerms(filter: null);
    controller = FloatingSearchBarController();
    casesUpdate(type:widget.type);

    controller2.addListener((){
      setState(() {

      });
    });
    controller2.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  casesUpdate({String type}){

    setState(() {
      content = type;
    });
  }

  var fsb;

  initialize()async{
    fsb = FloatingSearchBar.of(context).height;
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    initialize();

    return Scaffold(
       body:FloatingSearchBar(
           iconColor:Colors.deepOrangeAccent,
           controller:controller,
           builder:(BuildContext context, Animation<double> transition){
                 return ClipRRect(
                      borderRadius:BorderRadius.circular(8),
                      child:Material(
                        color:Colors.white,
                        elevation:4,
                        child:Builder(
                          builder:(context) {
                               if(filteredSearchHistory.isEmpty && controller.query.isEmpty){
                                  return Container(
                                    height:56,
                                    width:double.infinity,
                                    alignment:Alignment.center,
                                    child:Text(
                                      'Start Searching',
                                      maxLines:1,
                                      overflow:TextOverflow.ellipsis,
                                      style:Theme.of(context).textTheme.caption,
                                    ),
                                  );
                               }else if(filteredSearchHistory.isEmpty && controller.query.isNotEmpty){
                                 return ListTile(
                                   title: Text(controller.query),
                                   leading: const Icon(Icons.search),
                                   onTap:(){
                                     setState(() {
                                       addSearchTerm(controller.query);
                                       selectedTerm = controller.query;
                                     });
                                     controller.close();
                                   },
                                 );
                               }else{
                                 return Column(
                                   mainAxisSize:MainAxisSize.min,
                                   children:filteredSearchHistory.map((e)=>ListTile(
                                      title:Text(
                                        e,
                                        maxLines:1,
                                        overflow:TextOverflow.ellipsis,
                                      ),
                                     leading:const Icon(
                                         Icons.history,
                                         color:Colors.deepOrangeAccent
                                     ),
                                     trailing:IconButton(
                                       icon:const Icon(
                                           Icons.clear,
                                           color:Colors.deepOrangeAccent
                                       ),
                                       onPressed:(){
                                          setState(() {
                                            deleteSearchTerm(e);
                                          });
                                       },
                                     ),
                                     onTap: (){
                                        setState((){
                                           putSearchTermFirst(e);
                                        });
                                     },
                                   )).toList(),
                                 );
                               }
                          },
                        )
                      ),
                 );
         },
         transition:CircularFloatingSearchBarTransition(),
         physics:BouncingScrollPhysics(),
         title:Text(
           selectedTerm ?? 'Search for ${content}',
           style:TextStyle(
             color:Colors.black87,
             fontWeight:FontWeight.normal,
             fontSize:16.0
           ),
         ),
         hint:"Search And Find Out",
         actions:[
           FloatingSearchBarAction.searchToClear(),
         ],
         onQueryChanged:(query){
             setState(() {
               filteredSearchHistory = filterSearchTerms(filter:query);
             });
         },
         onSubmitted:(submitted){
             setState((){
               addSearchTerm(submitted);
               selectedTerm = submitted;
             });
             controller.close();
         },
         body:SafeArea(
           child:FloatingSearchBarScrollNotifier(
             child: Container(
                   child: Column(
                     children:[
                       //cardDescription(description:"Search For Products,Or Apartment By Typing Location",size:size),
                       Expanded(
                         child:Stack(
                           children:[
                             Visibility(
                               visible:!isClicked?true:false,
                               child: Container(
                                 height:MediaQuery.of(context).size.height,
                                 width:double.infinity,
                                 child:ListView.builder(
                                     itemCount:LocationList.length,
                                     itemBuilder:(context,index){
                                       return InkWell(
                                           onTap:(){
                                             setState((){
                                               isClicked = true;
                                               waitSec(time:6);
                                             });
                                           },
                                           child:checkTypeItem(obj:LocationList[index],size:size,description:null,title:"Choose State")
                                       );
                                     }
                                 ),
                               ),
                             ),


                             //Should Show Loader Before Local Goverment Area
                             Visibility(
                               visible:!isClicked?false:true,
                               child:widget.still_loading?Container(
                                   decoration: BoxDecoration(
                                     color:animation_color.value,
                                   ),
                                   width:MediaQuery.of(context).size.width,
                                   height:MediaQuery.of(context).size.height,
                                   child:Center(
                                       child:Loader()
                                   )
                               ):showWidget(),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),
             ),
           ),
         ),
       ),
    );
  }

  Future<void> waitSec({int time}) async {
    Timer timer;
    var _duration = Duration(seconds: time);

    timer = Timer(_duration, ()
    {
      setState(() {
         widget.still_loading = false;
      });
    });
  }

  Widget showWidget(){
    return Container(
      height:MediaQuery.of(context).size.height,
      width:double.infinity,
      child:ListView.builder(
          itemCount:locationLocalGov.length,
          itemBuilder:(context,index){
            return InkWell(
                onTap:(){
                  Get.to(()=>Apartments());
                },
                child:checkTypeItem(obj:locationLocalGov[index],size:size,description:null,title:"Choose Local Gov Area")
            );
          }
      ),
    );
  }

}
