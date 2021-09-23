import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_hud/progress_hud.dart';

import 'Blocs/OfferBlocs/offer_bloc.dart';
import 'Blocs/OfferBlocs/offer_event.dart';
import 'Blocs/OfferBlocs/offer_states.dart';
import 'Models/OfferResponseModel.dart';
import 'Models/Offers.dart';
import 'Utilities/Constants.dart';
import 'Utilities/Utils.dart';

class OfferTestScreen extends StatefulWidget {
  @override
  _OfferTestScreenState createState() => _OfferTestScreenState();
}

class _OfferTestScreenState extends State<OfferTestScreen> {
  late ProgressHUD _progressHUD;
  bool _loading = false;

  OfferResponseModel? offerResponseModel = new OfferResponseModel();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late OfferBloc offerBloc;

  @override
  void initState() {
    // TODO: implement initState

    offerBloc = BlocProvider.of<OfferBloc>(context);
    offerBloc.add(DoFetchEvent());

    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: AppColors.yellowColor,
      containerColor: AppColors.appBackground,
      borderRadius: 5.0,
      text: 'Loading...',
    );

    super.initState();
  }

  @override
  void dispose() {
    offerBloc.close();
    super.dispose();
  }

  Future<void> _refreshData() async {
    print('refreshing data...');
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 1;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 320;
    var _aspectRatio = _width / cellHeight;

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.appBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: _appBar(),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<OfferBloc, OfferStates>(
                      builder: (BuildContext context, OfferStates state) {
                        if (state is InitialState) {
                          return CircularProgressIndicator();
                        } else if (state is LoadingState) {
                          return CircularProgressIndicator();
                        } else if (state is FetchSuccess) {
                          return Container(
                              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: GridView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.offers!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return _offerListItem(state.offers![index]);
                                },
                                gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: _crossAxisCount,
                                    childAspectRatio: _aspectRatio,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent: 250),
                              ));
                        }
                        else if(state is ErrorStates){
                          return ErrorWidget(state.message.toString());
                        }
                        else{
                          return Container();
                        }
                      }),
                  // Container(
                  //   child: allProductListItem(),
                  // ),
                ],
              ),
            ),
            Visibility(visible: _loading, child: _progressHUD),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      elevation: 1.0,
      title: Text(
        "Latest listings",
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.nunitoSans,
            fontWeight: FontWeight.w400),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          color: AppColors.color001122,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: Image.asset("assets/images/search.png"),
          ),
        ),
        InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openEndDrawer();
          },
          child: Container(
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: Image.asset("assets/images/filter.png"),
          ),
        ),
      ],
    );
  }

  Widget _offerListItem(Offers data) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(width: 1.0, color: AppColors.appBackground),
            borderRadius: BorderRadius.all(Radius.circular(6.0))),
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border:
                  Border.all(width: 2.0, color: AppColors.hintColor),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              width: double.infinity,
              height: 180,
              // child: Utils().builtItemImageContainer(data.photoUrl),
              child: Utils().builtItemImageContainer(data.photoUrl),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "${data.title}",
              textAlign: TextAlign.justify,
              style: new TextStyle(
                  fontFamily: AppFonts.nunitoSans,
                  fontWeight: FontWeight.normal,
                  color: AppColors.color001122,
                  fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
