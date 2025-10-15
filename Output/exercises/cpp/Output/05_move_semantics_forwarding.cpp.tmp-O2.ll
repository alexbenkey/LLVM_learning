; ModuleID = '/home/alex/llvm-lit-exploration/exercises/cpp/05_move_semantics_forwarding.cpp'
source_filename = "/home/alex/llvm-lit-exploration/exercises/cpp/05_move_semantics_forwarding.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%class.MoveTracker = type { %"class.std::__cxx11::basic_string", ptr }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }

$_ZN11MoveTrackerC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE = comdat any

$_ZN11MoveTrackerD2Ev = comdat any

$_ZN11MoveTrackerC2ERKS_ = comdat any

$_ZN11MoveTrackerC2EOS_ = comdat any

$_Z14process_objectIR11MoveTrackerEvOT_ = comdat any

$_Z14process_objectI11MoveTrackerEvOT_ = comdat any

$__clang_call_terminate = comdat any

@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [28 x i8] c"=== Move Semantics Demo ===\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"\0A--- Test 1: Basic construction ---\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"\0A--- Test 2: Copy construction ---\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"\0A--- Test 3: Move construction ---\00", align 1
@.str.5 = private unnamed_addr constant [39 x i8] c"\0A--- Test 4: Function return (RVO) ---\00", align 1
@.str.7 = private unnamed_addr constant [45 x i8] c"\0A--- Test 5: Perfect forwarding (lvalue) ---\00", align 1
@.str.8 = private unnamed_addr constant [45 x i8] c"\0A--- Test 6: Perfect forwarding (rvalue) ---\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"temporary\00", align 1
@.str.10 = private unnamed_addr constant [51 x i8] c"\0A--- End of scope - destructors will be called ---\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"Constructor: \00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"Destructor: \00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"_copy\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"Copy constructor: \00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c" from \00", align 1
@.str.16 = private unnamed_addr constant [21 x i8] c"basic_string::append\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"_moved\00", align 1
@.str.18 = private unnamed_addr constant [19 x i8] c"Move constructor: \00", align 1
@.str.20 = private unnamed_addr constant [13 x i8] c"Processing: \00", align 1
@.str.21 = private unnamed_addr constant [15 x i8] c"Forwarded to: \00", align 1

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13create_objectRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr dead_on_unwind noalias nonnull writable sret(%class.MoveTracker) align 8 %0, ptr noundef nonnull align 8 dereferenceable(32) %1) local_unnamed_addr #0 {
  tail call void @_ZN11MoveTrackerC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(32) %1)
  ret void
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN11MoveTrackerC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(32) %1) unnamed_addr #0 comdat align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store ptr %4, ptr %0, align 8, !tbaa !5
  %5 = load ptr, ptr %1, align 8, !tbaa !11
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %7 = load i64, ptr %6, align 8, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #13
  store i64 %7, ptr %3, align 8, !tbaa !15
  %8 = icmp ugt i64 %7, 15
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = call noundef ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(8) %3, i64 noundef 0)
  store ptr %10, ptr %0, align 8, !tbaa !11
  %11 = load i64, ptr %3, align 8, !tbaa !15
  store i64 %11, ptr %4, align 8, !tbaa !16
  br label %12

12:                                               ; preds = %9, %2
  %13 = phi ptr [ %10, %9 ], [ %4, %2 ]
  switch i64 %7, label %16 [
    i64 1, label %14
    i64 0, label %17
  ]

14:                                               ; preds = %12
  %15 = load i8, ptr %5, align 1, !tbaa !16
  store i8 %15, ptr %13, align 1, !tbaa !16
  br label %17

16:                                               ; preds = %12
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %13, ptr align 1 %5, i64 %7, i1 false)
  br label %17

17:                                               ; preds = %12, %14, %16
  %18 = load i64, ptr %3, align 8, !tbaa !15
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 8
  store i64 %18, ptr %19, align 8, !tbaa !14
  %20 = load ptr, ptr %0, align 8, !tbaa !11
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 %18
  store i8 0, ptr %21, align 1, !tbaa !16
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #13
  %22 = invoke noalias noundef nonnull dereferenceable(4) ptr @_Znwm(i64 noundef 4) #14
          to label %23 unwind label %59

23:                                               ; preds = %17
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 32
  store i32 42, ptr %22, align 4, !tbaa !17
  store ptr %22, ptr %24, align 8, !tbaa !19
  %25 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.11, i64 noundef 13)
          to label %26 unwind label %59

26:                                               ; preds = %23
  %27 = load ptr, ptr %0, align 8, !tbaa !11
  %28 = load i64, ptr %19, align 8, !tbaa !14
  %29 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %27, i64 noundef %28)
          to label %30 unwind label %59

30:                                               ; preds = %26
  %31 = load ptr, ptr %29, align 8, !tbaa !22
  %32 = getelementptr i8, ptr %31, i64 -24
  %33 = load i64, ptr %32, align 8
  %34 = getelementptr inbounds i8, ptr %29, i64 %33
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 240
  %36 = load ptr, ptr %35, align 8, !tbaa !24
  %37 = icmp eq ptr %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %30
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %39 unwind label %59

39:                                               ; preds = %38
  unreachable

40:                                               ; preds = %30
  %41 = getelementptr inbounds nuw i8, ptr %36, i64 56
  %42 = load i8, ptr %41, align 8, !tbaa !40
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds nuw i8, ptr %36, i64 67
  %46 = load i8, ptr %45, align 1, !tbaa !16
  br label %53

47:                                               ; preds = %40
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %36)
          to label %48 unwind label %59

48:                                               ; preds = %47
  %49 = load ptr, ptr %36, align 8, !tbaa !22
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 48
  %51 = load ptr, ptr %50, align 8
  %52 = invoke noundef signext i8 %51(ptr noundef nonnull align 8 dereferenceable(570) %36, i8 noundef signext 10)
          to label %53 unwind label %59

53:                                               ; preds = %48, %44
  %54 = phi i8 [ %46, %44 ], [ %52, %48 ]
  %55 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %29, i8 noundef signext %54)
          to label %56 unwind label %59

56:                                               ; preds = %53
  %57 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %55)
          to label %58 unwind label %59

58:                                               ; preds = %56
  ret void

59:                                               ; preds = %56, %53, %48, %47, %38, %26, %23, %17
  %60 = landingpad { ptr, i32 }
          cleanup
  %61 = load ptr, ptr %0, align 8, !tbaa !11
  %62 = icmp eq ptr %61, %4
  br i1 %62, label %63, label %66

63:                                               ; preds = %59
  %64 = load i64, ptr %19, align 8, !tbaa !14
  %65 = icmp ult i64 %64, 16
  call void @llvm.assume(i1 %65)
  br label %69

66:                                               ; preds = %59
  %67 = load i64, ptr %4, align 8, !tbaa !16
  %68 = add i64 %67, 1
  call void @_ZdlPvm(ptr noundef %61, i64 noundef %68) #16
  br label %69

69:                                               ; preds = %63, %66
  resume { ptr, i32 } %60
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) unnamed_addr #1 comdat align 2 personality ptr @__gxx_personality_v0 {
  %2 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.12, i64 noundef 12)
          to label %3 unwind label %52

3:                                                ; preds = %1
  %4 = load ptr, ptr %0, align 8, !tbaa !11
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load i64, ptr %5, align 8, !tbaa !14
  %7 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %4, i64 noundef %6)
          to label %8 unwind label %52

8:                                                ; preds = %3
  %9 = load ptr, ptr %7, align 8, !tbaa !22
  %10 = getelementptr i8, ptr %9, i64 -24
  %11 = load i64, ptr %10, align 8
  %12 = getelementptr inbounds i8, ptr %7, i64 %11
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 240
  %14 = load ptr, ptr %13, align 8, !tbaa !24
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %8
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %17 unwind label %52

17:                                               ; preds = %16
  unreachable

18:                                               ; preds = %8
  %19 = getelementptr inbounds nuw i8, ptr %14, i64 56
  %20 = load i8, ptr %19, align 8, !tbaa !40
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %14, i64 67
  %24 = load i8, ptr %23, align 1, !tbaa !16
  br label %31

25:                                               ; preds = %18
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %14)
          to label %26 unwind label %52

26:                                               ; preds = %25
  %27 = load ptr, ptr %14, align 8, !tbaa !22
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 48
  %29 = load ptr, ptr %28, align 8
  %30 = invoke noundef signext i8 %29(ptr noundef nonnull align 8 dereferenceable(570) %14, i8 noundef signext 10)
          to label %31 unwind label %52

31:                                               ; preds = %26, %22
  %32 = phi i8 [ %24, %22 ], [ %30, %26 ]
  %33 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %7, i8 noundef signext %32)
          to label %34 unwind label %52

34:                                               ; preds = %31
  %35 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %33)
          to label %36 unwind label %52

36:                                               ; preds = %34
  %37 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %38 = load ptr, ptr %37, align 8, !tbaa !19
  %39 = icmp eq ptr %38, null
  br i1 %39, label %41, label %40

40:                                               ; preds = %36
  tail call void @_ZdlPvm(ptr noundef nonnull %38, i64 noundef 4) #16
  br label %41

41:                                               ; preds = %40, %36
  %42 = load ptr, ptr %0, align 8, !tbaa !11
  %43 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %44 = icmp eq ptr %42, %43
  br i1 %44, label %45, label %48

45:                                               ; preds = %41
  %46 = load i64, ptr %5, align 8, !tbaa !14
  %47 = icmp ult i64 %46, 16
  tail call void @llvm.assume(i1 %47)
  br label %51

48:                                               ; preds = %41
  %49 = load i64, ptr %43, align 8, !tbaa !16
  %50 = add i64 %49, 1
  tail call void @_ZdlPvm(ptr noundef %42, i64 noundef %50) #16
  br label %51

51:                                               ; preds = %45, %48
  ret void

52:                                               ; preds = %34, %31, %26, %25, %16, %3, %1
  %53 = landingpad { ptr, i32 }
          catch ptr null
  %54 = extractvalue { ptr, i32 } %53, 0
  tail call void @__clang_call_terminate(ptr %54) #17
  unreachable
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z19move_semantics_demov() local_unnamed_addr #0 personality ptr @__gxx_personality_v0 {
  %1 = alloca %class.MoveTracker, align 8
  %2 = alloca %"class.std::__cxx11::basic_string", align 8
  %3 = alloca %class.MoveTracker, align 8
  %4 = alloca %class.MoveTracker, align 8
  %5 = alloca %class.MoveTracker, align 8
  %6 = alloca %"class.std::__cxx11::basic_string", align 8
  %7 = alloca %class.MoveTracker, align 8
  %8 = alloca %"class.std::__cxx11::basic_string", align 8
  %9 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str, i64 noundef 27)
  %10 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %11 = getelementptr i8, ptr %10, i64 -24
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %12
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 240
  %15 = load ptr, ptr %14, align 8, !tbaa !24
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

18:                                               ; preds = %0
  %19 = getelementptr inbounds nuw i8, ptr %15, i64 56
  %20 = load i8, ptr %19, align 8, !tbaa !40
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %15, i64 67
  %24 = load i8, ptr %23, align 1, !tbaa !16
  br label %30

25:                                               ; preds = %18
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %15)
  %26 = load ptr, ptr %15, align 8, !tbaa !22
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 48
  %28 = load ptr, ptr %27, align 8
  %29 = tail call noundef signext i8 %28(ptr noundef nonnull align 8 dereferenceable(570) %15, i8 noundef signext 10)
  br label %30

30:                                               ; preds = %22, %25
  %31 = phi i8 [ %24, %22 ], [ %29, %25 ]
  %32 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %31)
  %33 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %32)
  %34 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.1, i64 noundef 35)
  %35 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %36 = getelementptr i8, ptr %35, i64 -24
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %37
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 240
  %40 = load ptr, ptr %39, align 8, !tbaa !24
  %41 = icmp eq ptr %40, null
  br i1 %41, label %42, label %43

42:                                               ; preds = %30
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

43:                                               ; preds = %30
  %44 = getelementptr inbounds nuw i8, ptr %40, i64 56
  %45 = load i8, ptr %44, align 8, !tbaa !40
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %50, label %47

47:                                               ; preds = %43
  %48 = getelementptr inbounds nuw i8, ptr %40, i64 67
  %49 = load i8, ptr %48, align 1, !tbaa !16
  br label %55

50:                                               ; preds = %43
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %40)
  %51 = load ptr, ptr %40, align 8, !tbaa !22
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 48
  %53 = load ptr, ptr %52, align 8
  %54 = tail call noundef signext i8 %53(ptr noundef nonnull align 8 dereferenceable(570) %40, i8 noundef signext 10)
  br label %55

55:                                               ; preds = %47, %50
  %56 = phi i8 [ %49, %47 ], [ %54, %50 ]
  %57 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %56)
  %58 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %57)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %1) #13
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %2) #13
  %59 = getelementptr inbounds nuw i8, ptr %2, i64 16
  store ptr %59, ptr %2, align 8, !tbaa !5
  store i64 7809644627822735983, ptr %59, align 8
  %60 = getelementptr inbounds nuw i8, ptr %2, i64 8
  store i64 8, ptr %60, align 8, !tbaa !14
  %61 = getelementptr inbounds nuw i8, ptr %2, i64 24
  store i8 0, ptr %61, align 8, !tbaa !16
  invoke void @_ZN11MoveTrackerC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(40) %1, ptr noundef nonnull align 8 dereferenceable(32) %2)
          to label %62 unwind label %277

62:                                               ; preds = %55
  %63 = load ptr, ptr %2, align 8, !tbaa !11
  %64 = icmp eq ptr %63, %59
  br i1 %64, label %65, label %68

65:                                               ; preds = %62
  %66 = load i64, ptr %60, align 8, !tbaa !14
  %67 = icmp ult i64 %66, 16
  call void @llvm.assume(i1 %67)
  br label %71

68:                                               ; preds = %62
  %69 = load i64, ptr %59, align 8, !tbaa !16
  %70 = add i64 %69, 1
  call void @_ZdlPvm(ptr noundef %63, i64 noundef %70) #16
  br label %71

71:                                               ; preds = %65, %68
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %2) #13
  %72 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 34)
          to label %73 unwind label %288

73:                                               ; preds = %71
  %74 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %75 = getelementptr i8, ptr %74, i64 -24
  %76 = load i64, ptr %75, align 8
  %77 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %76
  %78 = getelementptr inbounds nuw i8, ptr %77, i64 240
  %79 = load ptr, ptr %78, align 8, !tbaa !24
  %80 = icmp eq ptr %79, null
  br i1 %80, label %81, label %83

81:                                               ; preds = %73
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %82 unwind label %288

82:                                               ; preds = %81
  unreachable

83:                                               ; preds = %73
  %84 = getelementptr inbounds nuw i8, ptr %79, i64 56
  %85 = load i8, ptr %84, align 8, !tbaa !40
  %86 = icmp eq i8 %85, 0
  br i1 %86, label %90, label %87

87:                                               ; preds = %83
  %88 = getelementptr inbounds nuw i8, ptr %79, i64 67
  %89 = load i8, ptr %88, align 1, !tbaa !16
  br label %96

90:                                               ; preds = %83
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %79)
          to label %91 unwind label %288

91:                                               ; preds = %90
  %92 = load ptr, ptr %79, align 8, !tbaa !22
  %93 = getelementptr inbounds nuw i8, ptr %92, i64 48
  %94 = load ptr, ptr %93, align 8
  %95 = invoke noundef signext i8 %94(ptr noundef nonnull align 8 dereferenceable(570) %79, i8 noundef signext 10)
          to label %96 unwind label %288

96:                                               ; preds = %91, %87
  %97 = phi i8 [ %89, %87 ], [ %95, %91 ]
  %98 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %97)
          to label %99 unwind label %288

99:                                               ; preds = %96
  %100 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %98)
          to label %101 unwind label %288

101:                                              ; preds = %99
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %3) #13
  invoke void @_ZN11MoveTrackerC2ERKS_(ptr noundef nonnull align 8 dereferenceable(40) %3, ptr noundef nonnull align 8 dereferenceable(40) %1)
          to label %102 unwind label %290

102:                                              ; preds = %101
  %103 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.4, i64 noundef 34)
          to label %104 unwind label %292

104:                                              ; preds = %102
  %105 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %106 = getelementptr i8, ptr %105, i64 -24
  %107 = load i64, ptr %106, align 8
  %108 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %107
  %109 = getelementptr inbounds nuw i8, ptr %108, i64 240
  %110 = load ptr, ptr %109, align 8, !tbaa !24
  %111 = icmp eq ptr %110, null
  br i1 %111, label %112, label %114

112:                                              ; preds = %104
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %113 unwind label %292

113:                                              ; preds = %112
  unreachable

114:                                              ; preds = %104
  %115 = getelementptr inbounds nuw i8, ptr %110, i64 56
  %116 = load i8, ptr %115, align 8, !tbaa !40
  %117 = icmp eq i8 %116, 0
  br i1 %117, label %121, label %118

118:                                              ; preds = %114
  %119 = getelementptr inbounds nuw i8, ptr %110, i64 67
  %120 = load i8, ptr %119, align 1, !tbaa !16
  br label %127

121:                                              ; preds = %114
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %110)
          to label %122 unwind label %292

122:                                              ; preds = %121
  %123 = load ptr, ptr %110, align 8, !tbaa !22
  %124 = getelementptr inbounds nuw i8, ptr %123, i64 48
  %125 = load ptr, ptr %124, align 8
  %126 = invoke noundef signext i8 %125(ptr noundef nonnull align 8 dereferenceable(570) %110, i8 noundef signext 10)
          to label %127 unwind label %292

127:                                              ; preds = %122, %118
  %128 = phi i8 [ %120, %118 ], [ %126, %122 ]
  %129 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %128)
          to label %130 unwind label %292

130:                                              ; preds = %127
  %131 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %129)
          to label %132 unwind label %292

132:                                              ; preds = %130
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %4) #13
  call void @_ZN11MoveTrackerC2EOS_(ptr noundef nonnull align 8 dereferenceable(40) %4, ptr noundef nonnull align 8 dereferenceable(40) %1) #13
  %133 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 38)
          to label %134 unwind label %294

134:                                              ; preds = %132
  %135 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %136 = getelementptr i8, ptr %135, i64 -24
  %137 = load i64, ptr %136, align 8
  %138 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %137
  %139 = getelementptr inbounds nuw i8, ptr %138, i64 240
  %140 = load ptr, ptr %139, align 8, !tbaa !24
  %141 = icmp eq ptr %140, null
  br i1 %141, label %142, label %144

142:                                              ; preds = %134
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %143 unwind label %294

143:                                              ; preds = %142
  unreachable

144:                                              ; preds = %134
  %145 = getelementptr inbounds nuw i8, ptr %140, i64 56
  %146 = load i8, ptr %145, align 8, !tbaa !40
  %147 = icmp eq i8 %146, 0
  br i1 %147, label %151, label %148

148:                                              ; preds = %144
  %149 = getelementptr inbounds nuw i8, ptr %140, i64 67
  %150 = load i8, ptr %149, align 1, !tbaa !16
  br label %157

151:                                              ; preds = %144
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %140)
          to label %152 unwind label %294

152:                                              ; preds = %151
  %153 = load ptr, ptr %140, align 8, !tbaa !22
  %154 = getelementptr inbounds nuw i8, ptr %153, i64 48
  %155 = load ptr, ptr %154, align 8
  %156 = invoke noundef signext i8 %155(ptr noundef nonnull align 8 dereferenceable(570) %140, i8 noundef signext 10)
          to label %157 unwind label %294

157:                                              ; preds = %152, %148
  %158 = phi i8 [ %150, %148 ], [ %156, %152 ]
  %159 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %158)
          to label %160 unwind label %294

160:                                              ; preds = %157
  %161 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %159)
          to label %162 unwind label %294

162:                                              ; preds = %160
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %5) #13
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #13
  %163 = getelementptr inbounds nuw i8, ptr %6, i64 16
  store ptr %163, ptr %6, align 8, !tbaa !5
  store i64 7234309814316459378, ptr %163, align 8
  %164 = getelementptr inbounds nuw i8, ptr %6, i64 8
  store i64 8, ptr %164, align 8, !tbaa !14
  %165 = getelementptr inbounds nuw i8, ptr %6, i64 24
  store i8 0, ptr %165, align 8, !tbaa !16
  invoke void @_ZN11MoveTrackerC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(40) %5, ptr noundef nonnull align 8 dereferenceable(32) %6)
          to label %166 unwind label %296

166:                                              ; preds = %162
  %167 = load ptr, ptr %6, align 8, !tbaa !11
  %168 = icmp eq ptr %167, %163
  br i1 %168, label %169, label %172

169:                                              ; preds = %166
  %170 = load i64, ptr %164, align 8, !tbaa !14
  %171 = icmp ult i64 %170, 16
  call void @llvm.assume(i1 %171)
  br label %175

172:                                              ; preds = %166
  %173 = load i64, ptr %163, align 8, !tbaa !16
  %174 = add i64 %173, 1
  call void @_ZdlPvm(ptr noundef %167, i64 noundef %174) #16
  br label %175

175:                                              ; preds = %169, %172
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #13
  %176 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.7, i64 noundef 44)
          to label %177 unwind label %307

177:                                              ; preds = %175
  %178 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %179 = getelementptr i8, ptr %178, i64 -24
  %180 = load i64, ptr %179, align 8
  %181 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %180
  %182 = getelementptr inbounds nuw i8, ptr %181, i64 240
  %183 = load ptr, ptr %182, align 8, !tbaa !24
  %184 = icmp eq ptr %183, null
  br i1 %184, label %256, label %185

185:                                              ; preds = %177
  %186 = getelementptr inbounds nuw i8, ptr %183, i64 56
  %187 = load i8, ptr %186, align 8, !tbaa !40
  %188 = icmp eq i8 %187, 0
  br i1 %188, label %192, label %189

189:                                              ; preds = %185
  %190 = getelementptr inbounds nuw i8, ptr %183, i64 67
  %191 = load i8, ptr %190, align 1, !tbaa !16
  br label %198

192:                                              ; preds = %185
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %183)
          to label %193 unwind label %307

193:                                              ; preds = %192
  %194 = load ptr, ptr %183, align 8, !tbaa !22
  %195 = getelementptr inbounds nuw i8, ptr %194, i64 48
  %196 = load ptr, ptr %195, align 8
  %197 = invoke noundef signext i8 %196(ptr noundef nonnull align 8 dereferenceable(570) %183, i8 noundef signext 10)
          to label %198 unwind label %307

198:                                              ; preds = %193, %189
  %199 = phi i8 [ %191, %189 ], [ %197, %193 ]
  %200 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %199)
          to label %201 unwind label %307

201:                                              ; preds = %198
  %202 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %200)
          to label %203 unwind label %307

203:                                              ; preds = %201
  invoke void @_Z14process_objectIR11MoveTrackerEvOT_(ptr noundef nonnull align 8 dereferenceable(40) %3)
          to label %204 unwind label %307

204:                                              ; preds = %203
  %205 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.8, i64 noundef 44)
          to label %206 unwind label %307

206:                                              ; preds = %204
  %207 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %208 = getelementptr i8, ptr %207, i64 -24
  %209 = load i64, ptr %208, align 8
  %210 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %209
  %211 = getelementptr inbounds nuw i8, ptr %210, i64 240
  %212 = load ptr, ptr %211, align 8, !tbaa !24
  %213 = icmp eq ptr %212, null
  br i1 %213, label %256, label %214

214:                                              ; preds = %206
  %215 = getelementptr inbounds nuw i8, ptr %212, i64 56
  %216 = load i8, ptr %215, align 8, !tbaa !40
  %217 = icmp eq i8 %216, 0
  br i1 %217, label %221, label %218

218:                                              ; preds = %214
  %219 = getelementptr inbounds nuw i8, ptr %212, i64 67
  %220 = load i8, ptr %219, align 1, !tbaa !16
  br label %227

221:                                              ; preds = %214
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %212)
          to label %222 unwind label %307

222:                                              ; preds = %221
  %223 = load ptr, ptr %212, align 8, !tbaa !22
  %224 = getelementptr inbounds nuw i8, ptr %223, i64 48
  %225 = load ptr, ptr %224, align 8
  %226 = invoke noundef signext i8 %225(ptr noundef nonnull align 8 dereferenceable(570) %212, i8 noundef signext 10)
          to label %227 unwind label %307

227:                                              ; preds = %222, %218
  %228 = phi i8 [ %220, %218 ], [ %226, %222 ]
  %229 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %228)
          to label %230 unwind label %307

230:                                              ; preds = %227
  %231 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %229)
          to label %232 unwind label %307

232:                                              ; preds = %230
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %7) #13
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #13
  %233 = getelementptr inbounds nuw i8, ptr %8, i64 16
  store ptr %233, ptr %8, align 8, !tbaa !5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(9) %233, ptr noundef nonnull align 1 dereferenceable(9) @.str.9, i64 9, i1 false)
  %234 = getelementptr inbounds nuw i8, ptr %8, i64 8
  store i64 9, ptr %234, align 8, !tbaa !14
  %235 = getelementptr inbounds nuw i8, ptr %8, i64 25
  store i8 0, ptr %235, align 1, !tbaa !16
  invoke void @_ZN11MoveTrackerC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(ptr noundef nonnull align 8 dereferenceable(40) %7, ptr noundef nonnull align 8 dereferenceable(32) %8)
          to label %236 unwind label %309

236:                                              ; preds = %232
  invoke void @_Z14process_objectI11MoveTrackerEvOT_(ptr noundef nonnull align 8 dereferenceable(40) %7)
          to label %237 unwind label %311

237:                                              ; preds = %236
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %7) #13
  %238 = load ptr, ptr %8, align 8, !tbaa !11
  %239 = icmp eq ptr %238, %233
  br i1 %239, label %240, label %243

240:                                              ; preds = %237
  %241 = load i64, ptr %234, align 8, !tbaa !14
  %242 = icmp ult i64 %241, 16
  call void @llvm.assume(i1 %242)
  br label %246

243:                                              ; preds = %237
  %244 = load i64, ptr %233, align 8, !tbaa !16
  %245 = add i64 %244, 1
  call void @_ZdlPvm(ptr noundef %238, i64 noundef %245) #16
  br label %246

246:                                              ; preds = %240, %243
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %7) #13
  %247 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.10, i64 noundef 50)
          to label %248 unwind label %307

248:                                              ; preds = %246
  %249 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !22
  %250 = getelementptr i8, ptr %249, i64 -24
  %251 = load i64, ptr %250, align 8
  %252 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %251
  %253 = getelementptr inbounds nuw i8, ptr %252, i64 240
  %254 = load ptr, ptr %253, align 8, !tbaa !24
  %255 = icmp eq ptr %254, null
  br i1 %255, label %256, label %258

256:                                              ; preds = %248, %206, %177
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %257 unwind label %307

257:                                              ; preds = %256
  unreachable

258:                                              ; preds = %248
  %259 = getelementptr inbounds nuw i8, ptr %254, i64 56
  %260 = load i8, ptr %259, align 8, !tbaa !40
  %261 = icmp eq i8 %260, 0
  br i1 %261, label %265, label %262

262:                                              ; preds = %258
  %263 = getelementptr inbounds nuw i8, ptr %254, i64 67
  %264 = load i8, ptr %263, align 1, !tbaa !16
  br label %271

265:                                              ; preds = %258
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %254)
          to label %266 unwind label %307

266:                                              ; preds = %265
  %267 = load ptr, ptr %254, align 8, !tbaa !22
  %268 = getelementptr inbounds nuw i8, ptr %267, i64 48
  %269 = load ptr, ptr %268, align 8
  %270 = invoke noundef signext i8 %269(ptr noundef nonnull align 8 dereferenceable(570) %254, i8 noundef signext 10)
          to label %271 unwind label %307

271:                                              ; preds = %266, %262
  %272 = phi i8 [ %264, %262 ], [ %270, %266 ]
  %273 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %272)
          to label %274 unwind label %307

274:                                              ; preds = %271
  %275 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %273)
          to label %276 unwind label %307

276:                                              ; preds = %274
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %5) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %5) #13
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %4) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %4) #13
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #13
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %1) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #13
  ret void

277:                                              ; preds = %55
  %278 = landingpad { ptr, i32 }
          cleanup
  %279 = load ptr, ptr %2, align 8, !tbaa !11
  %280 = icmp eq ptr %279, %59
  br i1 %280, label %281, label %284

281:                                              ; preds = %277
  %282 = load i64, ptr %60, align 8, !tbaa !14
  %283 = icmp ult i64 %282, 16
  call void @llvm.assume(i1 %283)
  br label %287

284:                                              ; preds = %277
  %285 = load i64, ptr %59, align 8, !tbaa !16
  %286 = add i64 %285, 1
  call void @_ZdlPvm(ptr noundef %279, i64 noundef %286) #16
  br label %287

287:                                              ; preds = %284, %281
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %2) #13
  br label %336

288:                                              ; preds = %99, %96, %91, %90, %81, %71
  %289 = landingpad { ptr, i32 }
          cleanup
  br label %334

290:                                              ; preds = %101
  %291 = landingpad { ptr, i32 }
          cleanup
  br label %332

292:                                              ; preds = %130, %127, %122, %121, %112, %102
  %293 = landingpad { ptr, i32 }
          cleanup
  br label %330

294:                                              ; preds = %160, %157, %152, %151, %142, %132
  %295 = landingpad { ptr, i32 }
          cleanup
  br label %328

296:                                              ; preds = %162
  %297 = landingpad { ptr, i32 }
          cleanup
  %298 = load ptr, ptr %6, align 8, !tbaa !11
  %299 = icmp eq ptr %298, %163
  br i1 %299, label %300, label %303

300:                                              ; preds = %296
  %301 = load i64, ptr %164, align 8, !tbaa !14
  %302 = icmp ult i64 %301, 16
  call void @llvm.assume(i1 %302)
  br label %306

303:                                              ; preds = %296
  %304 = load i64, ptr %163, align 8, !tbaa !16
  %305 = add i64 %304, 1
  call void @_ZdlPvm(ptr noundef %298, i64 noundef %305) #16
  br label %306

306:                                              ; preds = %303, %300
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #13
  br label %326

307:                                              ; preds = %256, %274, %271, %266, %265, %230, %227, %222, %221, %201, %198, %193, %192, %246, %204, %175, %203
  %308 = landingpad { ptr, i32 }
          cleanup
  br label %324

309:                                              ; preds = %232
  %310 = landingpad { ptr, i32 }
          cleanup
  br label %313

311:                                              ; preds = %236
  %312 = landingpad { ptr, i32 }
          cleanup
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %7) #13
  br label %313

313:                                              ; preds = %311, %309
  %314 = phi { ptr, i32 } [ %312, %311 ], [ %310, %309 ]
  %315 = load ptr, ptr %8, align 8, !tbaa !11
  %316 = icmp eq ptr %315, %233
  br i1 %316, label %317, label %320

317:                                              ; preds = %313
  %318 = load i64, ptr %234, align 8, !tbaa !14
  %319 = icmp ult i64 %318, 16
  call void @llvm.assume(i1 %319)
  br label %323

320:                                              ; preds = %313
  %321 = load i64, ptr %233, align 8, !tbaa !16
  %322 = add i64 %321, 1
  call void @_ZdlPvm(ptr noundef %315, i64 noundef %322) #16
  br label %323

323:                                              ; preds = %320, %317
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %7) #13
  br label %324

324:                                              ; preds = %323, %307
  %325 = phi { ptr, i32 } [ %308, %307 ], [ %314, %323 ]
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %5) #13
  br label %326

326:                                              ; preds = %324, %306
  %327 = phi { ptr, i32 } [ %325, %324 ], [ %297, %306 ]
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %5) #13
  br label %328

328:                                              ; preds = %326, %294
  %329 = phi { ptr, i32 } [ %327, %326 ], [ %295, %294 ]
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %4) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %4) #13
  br label %330

330:                                              ; preds = %328, %292
  %331 = phi { ptr, i32 } [ %329, %328 ], [ %293, %292 ]
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #13
  br label %332

332:                                              ; preds = %330, %290
  %333 = phi { ptr, i32 } [ %331, %330 ], [ %291, %290 ]
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #13
  br label %334

334:                                              ; preds = %332, %288
  %335 = phi { ptr, i32 } [ %333, %332 ], [ %289, %288 ]
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %1) #13
  br label %336

336:                                              ; preds = %334, %287
  %337 = phi { ptr, i32 } [ %335, %334 ], [ %278, %287 ]
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #13
  resume { ptr, i32 } %337
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

declare i32 @__gxx_personality_v0(...)

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN11MoveTrackerC2ERKS_(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) unnamed_addr #0 comdat align 2 personality ptr @__gxx_personality_v0 {
  tail call void @llvm.experimental.noalias.scope.decl(metadata !45)
  %3 = load ptr, ptr %1, align 8, !tbaa !11, !noalias !45
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %5 = load i64, ptr %4, align 8, !tbaa !14, !noalias !45
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store ptr %6, ptr %0, align 8, !tbaa !5, !alias.scope !48
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 8
  store i64 0, ptr %7, align 8, !tbaa !14, !alias.scope !48
  store i8 0, ptr %6, align 8, !tbaa !16, !alias.scope !48
  %8 = add i64 %5, 5
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %8)
          to label %9 unwind label %23

9:                                                ; preds = %2
  %10 = load i64, ptr %7, align 8, !tbaa !14, !alias.scope !48
  %11 = sub i64 4611686018427387903, %10
  %12 = icmp ult i64 %11, %5
  br i1 %12, label %19, label %13

13:                                               ; preds = %9
  %14 = invoke noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %3, i64 noundef %5)
          to label %15 unwind label %23

15:                                               ; preds = %13
  %16 = load i64, ptr %7, align 8, !tbaa !14, !alias.scope !48
  %17 = add i64 %16, -4611686018427387899
  %18 = icmp ult i64 %17, 5
  br i1 %18, label %19, label %21

19:                                               ; preds = %15, %9
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.16) #15
          to label %20 unwind label %23

20:                                               ; preds = %19
  unreachable

21:                                               ; preds = %15
  %22 = invoke noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull @.str.13, i64 noundef 5)
          to label %35 unwind label %23

23:                                               ; preds = %21, %19, %13, %2
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = load ptr, ptr %0, align 8, !tbaa !11, !alias.scope !48
  %26 = icmp eq ptr %25, %6
  br i1 %26, label %27, label %30

27:                                               ; preds = %23
  %28 = load i64, ptr %7, align 8, !tbaa !14, !alias.scope !48
  %29 = icmp ult i64 %28, 16
  tail call void @llvm.assume(i1 %29)
  br label %33

30:                                               ; preds = %23
  %31 = load i64, ptr %6, align 8, !tbaa !16, !alias.scope !48
  %32 = add i64 %31, 1
  tail call void @_ZdlPvm(ptr noundef %25, i64 noundef %32) #16
  br label %33

33:                                               ; preds = %89, %86, %27, %30
  %34 = phi { ptr, i32 } [ %24, %30 ], [ %24, %27 ], [ %83, %86 ], [ %83, %89 ]
  resume { ptr, i32 } %34

35:                                               ; preds = %21
  %36 = invoke noalias noundef nonnull dereferenceable(4) ptr @_Znwm(i64 noundef 4) #14
          to label %37 unwind label %82

37:                                               ; preds = %35
  %38 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %39 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %40 = load ptr, ptr %39, align 8, !tbaa !19
  %41 = load i32, ptr %40, align 4, !tbaa !17
  store i32 %41, ptr %36, align 4, !tbaa !17
  store ptr %36, ptr %38, align 8, !tbaa !19
  %42 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.14, i64 noundef 18)
          to label %43 unwind label %82

43:                                               ; preds = %37
  %44 = load ptr, ptr %0, align 8, !tbaa !11
  %45 = load i64, ptr %7, align 8, !tbaa !14
  %46 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %44, i64 noundef %45)
          to label %47 unwind label %82

47:                                               ; preds = %43
  %48 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %46, ptr noundef nonnull @.str.15, i64 noundef 6)
          to label %49 unwind label %82

49:                                               ; preds = %47
  %50 = load ptr, ptr %1, align 8, !tbaa !11
  %51 = load i64, ptr %4, align 8, !tbaa !14
  %52 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %46, ptr noundef %50, i64 noundef %51)
          to label %53 unwind label %82

53:                                               ; preds = %49
  %54 = load ptr, ptr %52, align 8, !tbaa !22
  %55 = getelementptr i8, ptr %54, i64 -24
  %56 = load i64, ptr %55, align 8
  %57 = getelementptr inbounds i8, ptr %52, i64 %56
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 240
  %59 = load ptr, ptr %58, align 8, !tbaa !24
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %63

61:                                               ; preds = %53
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %62 unwind label %82

62:                                               ; preds = %61
  unreachable

63:                                               ; preds = %53
  %64 = getelementptr inbounds nuw i8, ptr %59, i64 56
  %65 = load i8, ptr %64, align 8, !tbaa !40
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %70, label %67

67:                                               ; preds = %63
  %68 = getelementptr inbounds nuw i8, ptr %59, i64 67
  %69 = load i8, ptr %68, align 1, !tbaa !16
  br label %76

70:                                               ; preds = %63
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %59)
          to label %71 unwind label %82

71:                                               ; preds = %70
  %72 = load ptr, ptr %59, align 8, !tbaa !22
  %73 = getelementptr inbounds nuw i8, ptr %72, i64 48
  %74 = load ptr, ptr %73, align 8
  %75 = invoke noundef signext i8 %74(ptr noundef nonnull align 8 dereferenceable(570) %59, i8 noundef signext 10)
          to label %76 unwind label %82

76:                                               ; preds = %71, %67
  %77 = phi i8 [ %69, %67 ], [ %75, %71 ]
  %78 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %52, i8 noundef signext %77)
          to label %79 unwind label %82

79:                                               ; preds = %76
  %80 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %78)
          to label %81 unwind label %82

81:                                               ; preds = %79
  ret void

82:                                               ; preds = %79, %76, %71, %70, %61, %49, %47, %43, %37, %35
  %83 = landingpad { ptr, i32 }
          cleanup
  %84 = load ptr, ptr %0, align 8, !tbaa !11
  %85 = icmp eq ptr %84, %6
  br i1 %85, label %86, label %89

86:                                               ; preds = %82
  %87 = load i64, ptr %7, align 8, !tbaa !14
  %88 = icmp ult i64 %87, 16
  tail call void @llvm.assume(i1 %88)
  br label %33

89:                                               ; preds = %82
  %90 = load i64, ptr %6, align 8, !tbaa !16
  %91 = add i64 %90, 1
  tail call void @_ZdlPvm(ptr noundef %84, i64 noundef %91) #16
  br label %33
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZN11MoveTrackerC2EOS_(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) unnamed_addr #1 comdat align 2 personality ptr @__gxx_personality_v0 {
  tail call void @llvm.experimental.noalias.scope.decl(metadata !51)
  %3 = load ptr, ptr %1, align 8, !tbaa !11, !noalias !51
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %5 = load i64, ptr %4, align 8, !tbaa !14, !noalias !51
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 16
  store ptr %6, ptr %0, align 8, !tbaa !5, !alias.scope !54
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 8
  store i64 0, ptr %7, align 8, !tbaa !14, !alias.scope !54
  store i8 0, ptr %6, align 8, !tbaa !16, !alias.scope !54
  %8 = add i64 %5, 6
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(32) %0, i64 noundef %8)
          to label %9 unwind label %23

9:                                                ; preds = %2
  %10 = load i64, ptr %7, align 8, !tbaa !14, !alias.scope !54
  %11 = sub i64 4611686018427387903, %10
  %12 = icmp ult i64 %11, %5
  br i1 %12, label %19, label %13

13:                                               ; preds = %9
  %14 = invoke noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %3, i64 noundef %5)
          to label %15 unwind label %23

15:                                               ; preds = %13
  %16 = load i64, ptr %7, align 8, !tbaa !14, !alias.scope !54
  %17 = add i64 %16, -4611686018427387898
  %18 = icmp ult i64 %17, 6
  br i1 %18, label %19, label %21

19:                                               ; preds = %15, %9
  invoke void @_ZSt20__throw_length_errorPKc(ptr noundef nonnull @.str.16) #15
          to label %20 unwind label %23

20:                                               ; preds = %19
  unreachable

21:                                               ; preds = %15
  %22 = invoke noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull @.str.17, i64 noundef 6)
          to label %33 unwind label %23

23:                                               ; preds = %21, %19, %13, %2
  %24 = landingpad { ptr, i32 }
          catch ptr null
  %25 = load ptr, ptr %0, align 8, !tbaa !11, !alias.scope !54
  %26 = icmp eq ptr %25, %6
  br i1 %26, label %27, label %30

27:                                               ; preds = %23
  %28 = load i64, ptr %7, align 8, !tbaa !14, !alias.scope !54
  %29 = icmp ult i64 %28, 16
  tail call void @llvm.assume(i1 %29)
  br label %79

30:                                               ; preds = %23
  %31 = load i64, ptr %6, align 8, !tbaa !16, !alias.scope !54
  %32 = add i64 %31, 1
  tail call void @_ZdlPvm(ptr noundef %25, i64 noundef %32) #16
  br label %79

33:                                               ; preds = %21
  %34 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %36 = load ptr, ptr %35, align 8, !tbaa !19
  store ptr %36, ptr %34, align 8, !tbaa !19
  store ptr null, ptr %35, align 8, !tbaa !19
  %37 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.18, i64 noundef 18)
          to label %38 unwind label %77

38:                                               ; preds = %33
  %39 = load ptr, ptr %0, align 8, !tbaa !11
  %40 = load i64, ptr %7, align 8, !tbaa !14
  %41 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %39, i64 noundef %40)
          to label %42 unwind label %77

42:                                               ; preds = %38
  %43 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %41, ptr noundef nonnull @.str.15, i64 noundef 6)
          to label %44 unwind label %77

44:                                               ; preds = %42
  %45 = load ptr, ptr %1, align 8, !tbaa !11
  %46 = load i64, ptr %4, align 8, !tbaa !14
  %47 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %41, ptr noundef %45, i64 noundef %46)
          to label %48 unwind label %77

48:                                               ; preds = %44
  %49 = load ptr, ptr %47, align 8, !tbaa !22
  %50 = getelementptr i8, ptr %49, i64 -24
  %51 = load i64, ptr %50, align 8
  %52 = getelementptr inbounds i8, ptr %47, i64 %51
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 240
  %54 = load ptr, ptr %53, align 8, !tbaa !24
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %58

56:                                               ; preds = %48
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %57 unwind label %77

57:                                               ; preds = %56
  unreachable

58:                                               ; preds = %48
  %59 = getelementptr inbounds nuw i8, ptr %54, i64 56
  %60 = load i8, ptr %59, align 8, !tbaa !40
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %65, label %62

62:                                               ; preds = %58
  %63 = getelementptr inbounds nuw i8, ptr %54, i64 67
  %64 = load i8, ptr %63, align 1, !tbaa !16
  br label %71

65:                                               ; preds = %58
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %54)
          to label %66 unwind label %77

66:                                               ; preds = %65
  %67 = load ptr, ptr %54, align 8, !tbaa !22
  %68 = getelementptr inbounds nuw i8, ptr %67, i64 48
  %69 = load ptr, ptr %68, align 8
  %70 = invoke noundef signext i8 %69(ptr noundef nonnull align 8 dereferenceable(570) %54, i8 noundef signext 10)
          to label %71 unwind label %77

71:                                               ; preds = %66, %62
  %72 = phi i8 [ %64, %62 ], [ %70, %66 ]
  %73 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %47, i8 noundef signext %72)
          to label %74 unwind label %77

74:                                               ; preds = %71
  %75 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %73)
          to label %76 unwind label %77

76:                                               ; preds = %74
  ret void

77:                                               ; preds = %74, %71, %66, %65, %56, %44, %42, %38, %33
  %78 = landingpad { ptr, i32 }
          catch ptr null
  br label %79

79:                                               ; preds = %27, %30, %77
  %80 = phi { ptr, i32 } [ %78, %77 ], [ %24, %30 ], [ %24, %27 ]
  %81 = extractvalue { ptr, i32 } %80, 0
  tail call void @__clang_call_terminate(ptr %81) #17
  unreachable
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_Z14process_objectIR11MoveTrackerEvOT_(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #0 comdat personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.MoveTracker, align 8
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.20, i64 noundef 12)
  %4 = load ptr, ptr %0, align 8, !tbaa !11
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load i64, ptr %5, align 8, !tbaa !14
  %7 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %4, i64 noundef %6)
  %8 = load ptr, ptr %7, align 8, !tbaa !22
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %7, i64 %10
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 240
  %13 = load ptr, ptr %12, align 8, !tbaa !24
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %1
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

16:                                               ; preds = %1
  %17 = getelementptr inbounds nuw i8, ptr %13, i64 56
  %18 = load i8, ptr %17, align 8, !tbaa !40
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %16
  %21 = getelementptr inbounds nuw i8, ptr %13, i64 67
  %22 = load i8, ptr %21, align 1, !tbaa !16
  br label %28

23:                                               ; preds = %16
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %13)
  %24 = load ptr, ptr %13, align 8, !tbaa !22
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 48
  %26 = load ptr, ptr %25, align 8
  %27 = tail call noundef signext i8 %26(ptr noundef nonnull align 8 dereferenceable(570) %13, i8 noundef signext 10)
  br label %28

28:                                               ; preds = %20, %23
  %29 = phi i8 [ %22, %20 ], [ %27, %23 ]
  %30 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %7, i8 noundef signext %29)
  %31 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %30)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %2) #13
  call void @_ZN11MoveTrackerC2ERKS_(ptr noundef nonnull align 8 dereferenceable(40) %2, ptr noundef nonnull align 8 dereferenceable(40) %0)
  %32 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.21, i64 noundef 14)
          to label %33 unwind label %67

33:                                               ; preds = %28
  %34 = load ptr, ptr %2, align 8, !tbaa !11
  %35 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %36 = load i64, ptr %35, align 8, !tbaa !14
  %37 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %34, i64 noundef %36)
          to label %38 unwind label %67

38:                                               ; preds = %33
  %39 = load ptr, ptr %37, align 8, !tbaa !22
  %40 = getelementptr i8, ptr %39, i64 -24
  %41 = load i64, ptr %40, align 8
  %42 = getelementptr inbounds i8, ptr %37, i64 %41
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 240
  %44 = load ptr, ptr %43, align 8, !tbaa !24
  %45 = icmp eq ptr %44, null
  br i1 %45, label %46, label %48

46:                                               ; preds = %38
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %47 unwind label %67

47:                                               ; preds = %46
  unreachable

48:                                               ; preds = %38
  %49 = getelementptr inbounds nuw i8, ptr %44, i64 56
  %50 = load i8, ptr %49, align 8, !tbaa !40
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %55, label %52

52:                                               ; preds = %48
  %53 = getelementptr inbounds nuw i8, ptr %44, i64 67
  %54 = load i8, ptr %53, align 1, !tbaa !16
  br label %61

55:                                               ; preds = %48
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %44)
          to label %56 unwind label %67

56:                                               ; preds = %55
  %57 = load ptr, ptr %44, align 8, !tbaa !22
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 48
  %59 = load ptr, ptr %58, align 8
  %60 = invoke noundef signext i8 %59(ptr noundef nonnull align 8 dereferenceable(570) %44, i8 noundef signext 10)
          to label %61 unwind label %67

61:                                               ; preds = %56, %52
  %62 = phi i8 [ %54, %52 ], [ %60, %56 ]
  %63 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %37, i8 noundef signext %62)
          to label %64 unwind label %67

64:                                               ; preds = %61
  %65 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %63)
          to label %66 unwind label %67

66:                                               ; preds = %64
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %2) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %2) #13
  ret void

67:                                               ; preds = %64, %61, %56, %55, %46, %33, %28
  %68 = landingpad { ptr, i32 }
          cleanup
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %2) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %2) #13
  resume { ptr, i32 } %68
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_Z14process_objectI11MoveTrackerEvOT_(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #0 comdat personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.MoveTracker, align 8
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.20, i64 noundef 12)
  %4 = load ptr, ptr %0, align 8, !tbaa !11
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load i64, ptr %5, align 8, !tbaa !14
  %7 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %4, i64 noundef %6)
  %8 = load ptr, ptr %7, align 8, !tbaa !22
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %7, i64 %10
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 240
  %13 = load ptr, ptr %12, align 8, !tbaa !24
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %1
  tail call void @_ZSt16__throw_bad_castv() #15
  unreachable

16:                                               ; preds = %1
  %17 = getelementptr inbounds nuw i8, ptr %13, i64 56
  %18 = load i8, ptr %17, align 8, !tbaa !40
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %16
  %21 = getelementptr inbounds nuw i8, ptr %13, i64 67
  %22 = load i8, ptr %21, align 1, !tbaa !16
  br label %28

23:                                               ; preds = %16
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %13)
  %24 = load ptr, ptr %13, align 8, !tbaa !22
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 48
  %26 = load ptr, ptr %25, align 8
  %27 = tail call noundef signext i8 %26(ptr noundef nonnull align 8 dereferenceable(570) %13, i8 noundef signext 10)
  br label %28

28:                                               ; preds = %20, %23
  %29 = phi i8 [ %22, %20 ], [ %27, %23 ]
  %30 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %7, i8 noundef signext %29)
  %31 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %30)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %2) #13
  call void @_ZN11MoveTrackerC2EOS_(ptr noundef nonnull align 8 dereferenceable(40) %2, ptr noundef nonnull align 8 dereferenceable(40) %0) #13
  %32 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.21, i64 noundef 14)
          to label %33 unwind label %67

33:                                               ; preds = %28
  %34 = load ptr, ptr %2, align 8, !tbaa !11
  %35 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %36 = load i64, ptr %35, align 8, !tbaa !14
  %37 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef %34, i64 noundef %36)
          to label %38 unwind label %67

38:                                               ; preds = %33
  %39 = load ptr, ptr %37, align 8, !tbaa !22
  %40 = getelementptr i8, ptr %39, i64 -24
  %41 = load i64, ptr %40, align 8
  %42 = getelementptr inbounds i8, ptr %37, i64 %41
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 240
  %44 = load ptr, ptr %43, align 8, !tbaa !24
  %45 = icmp eq ptr %44, null
  br i1 %45, label %46, label %48

46:                                               ; preds = %38
  invoke void @_ZSt16__throw_bad_castv() #15
          to label %47 unwind label %67

47:                                               ; preds = %46
  unreachable

48:                                               ; preds = %38
  %49 = getelementptr inbounds nuw i8, ptr %44, i64 56
  %50 = load i8, ptr %49, align 8, !tbaa !40
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %55, label %52

52:                                               ; preds = %48
  %53 = getelementptr inbounds nuw i8, ptr %44, i64 67
  %54 = load i8, ptr %53, align 1, !tbaa !16
  br label %61

55:                                               ; preds = %48
  invoke void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %44)
          to label %56 unwind label %67

56:                                               ; preds = %55
  %57 = load ptr, ptr %44, align 8, !tbaa !22
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 48
  %59 = load ptr, ptr %58, align 8
  %60 = invoke noundef signext i8 %59(ptr noundef nonnull align 8 dereferenceable(570) %44, i8 noundef signext 10)
          to label %61 unwind label %67

61:                                               ; preds = %56, %52
  %62 = phi i8 [ %54, %52 ], [ %60, %56 ]
  %63 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %37, i8 noundef signext %62)
          to label %64 unwind label %67

64:                                               ; preds = %61
  %65 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %63)
          to label %66 unwind label %67

66:                                               ; preds = %64
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %2) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %2) #13
  ret void

67:                                               ; preds = %64, %61, %56, %55, %46, %33, %28
  %68 = landingpad { ptr, i32 }
          cleanup
  call void @_ZN11MoveTrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(40) %2) #13
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %2) #13
  resume { ptr, i32 } %68
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #3 {
  tail call void @_Z19move_semantics_demov()
  ret i32 0
}

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znwm(i64 noundef) local_unnamed_addr #4

declare noundef ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm(ptr noundef nonnull align 8 dereferenceable(32), ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #5

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #6 comdat {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #13
  tail call void @_ZSt9terminatev() #17
  unreachable
}

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

; Function Attrs: cold nofree noreturn
declare void @_ZSt9terminatev() local_unnamed_addr #7

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPvm(ptr noundef, i64 noundef) local_unnamed_addr #9

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #5

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(32), i64 noundef) local_unnamed_addr #5

declare noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm(ptr noundef nonnull align 8 dereferenceable(32), ptr noundef, i64 noundef) local_unnamed_addr #5

; Function Attrs: cold noreturn
declare void @_ZSt20__throw_length_errorPKc(ptr noundef) local_unnamed_addr #10

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #5

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #5

; Function Attrs: cold noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #10

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #12

attributes #0 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline noreturn nounwind uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { cold nofree noreturn }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { cold noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #13 = { nounwind }
attributes #14 = { builtin allocsize(0) }
attributes #15 = { cold noreturn }
attributes #16 = { builtin nounwind }
attributes #17 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !7, i64 0}
!7 = !{!"p1 omnipotent char", !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !7, i64 0}
!12 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !6, i64 0, !13, i64 8, !9, i64 16}
!13 = !{!"long", !9, i64 0}
!14 = !{!12, !13, i64 8}
!15 = !{!13, !13, i64 0}
!16 = !{!9, !9, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !9, i64 0}
!19 = !{!20, !21, i64 32}
!20 = !{!"_ZTS11MoveTracker", !12, i64 0, !21, i64 32}
!21 = !{!"p1 int", !8, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"vtable pointer", !10, i64 0}
!24 = !{!25, !37, i64 240}
!25 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !26, i64 0, !34, i64 216, !9, i64 224, !35, i64 225, !36, i64 232, !37, i64 240, !38, i64 248, !39, i64 256}
!26 = !{!"_ZTSSt8ios_base", !13, i64 8, !13, i64 16, !27, i64 24, !28, i64 28, !28, i64 32, !29, i64 40, !30, i64 48, !9, i64 64, !18, i64 192, !31, i64 200, !32, i64 208}
!27 = !{!"_ZTSSt13_Ios_Fmtflags", !9, i64 0}
!28 = !{!"_ZTSSt12_Ios_Iostate", !9, i64 0}
!29 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !8, i64 0}
!30 = !{!"_ZTSNSt8ios_base6_WordsE", !8, i64 0, !13, i64 8}
!31 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !8, i64 0}
!32 = !{!"_ZTSSt6locale", !33, i64 0}
!33 = !{!"p1 _ZTSNSt6locale5_ImplE", !8, i64 0}
!34 = !{!"p1 _ZTSSo", !8, i64 0}
!35 = !{!"bool", !9, i64 0}
!36 = !{!"p1 _ZTSSt15basic_streambufIcSt11char_traitsIcEE", !8, i64 0}
!37 = !{!"p1 _ZTSSt5ctypeIcE", !8, i64 0}
!38 = !{!"p1 _ZTSSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE", !8, i64 0}
!39 = !{!"p1 _ZTSSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE", !8, i64 0}
!40 = !{!41, !9, i64 56}
!41 = !{!"_ZTSSt5ctypeIcE", !42, i64 0, !43, i64 16, !35, i64 24, !21, i64 32, !21, i64 40, !44, i64 48, !9, i64 56, !9, i64 57, !9, i64 313, !9, i64 569}
!42 = !{!"_ZTSNSt6locale5facetE", !18, i64 8}
!43 = !{!"p1 _ZTS15__locale_struct", !8, i64 0}
!44 = !{!"p1 short", !8, i64 0}
!45 = !{!46}
!46 = distinct !{!46, !47, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: argument 0"}
!47 = distinct !{!47, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!48 = !{!49, !46}
!49 = distinct !{!49, !50, !"_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE: argument 0"}
!50 = distinct !{!50, !"_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE"}
!51 = !{!52}
!52 = distinct !{!52, !53, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: argument 0"}
!53 = distinct !{!53, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!54 = !{!55, !52}
!55 = distinct !{!55, !56, !"_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE: argument 0"}
!56 = distinct !{!56, !"_ZSt12__str_concatINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET_PKNS6_10value_typeENS6_9size_typeES9_SA_RKNS6_14allocator_typeE"}
