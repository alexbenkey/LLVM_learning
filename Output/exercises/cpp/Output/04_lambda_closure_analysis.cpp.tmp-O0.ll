; ModuleID = '/home/alex/llvm-lit-exploration/exercises/cpp/04_lambda_closure_analysis.cpp'
source_filename = "/home/alex/llvm-lit-exploration/exercises/cpp/04_lambda_closure_analysis.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

module asm ".globl _ZSt21ios_base_library_initv"

%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%class.anon = type { i32, i32 }
%class.anon.0 = type { ptr, ptr }
%class.anon.1 = type { i32, i32 }
%class.anon.2 = type <{ ptr, i32, [4 x i8] }>

@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [32 x i8] c"=== Lambda Capture Analysis ===\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Original values: x=\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c", y=\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Lambda1 result: \00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"After lambda1: x=\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Lambda2 result: \00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"After lambda2: x=\00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"Lambda3 result: \00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"After lambda3: x=\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"Lambda4 result: \00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"After lambda4: x=\00", align 1

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_Z23lambda_capture_analysisv() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %class.anon, align 4
  %4 = alloca %class.anon.0, align 8
  %5 = alloca %class.anon.1, align 4
  %6 = alloca %class.anon.2, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 10, ptr %1, align 4
  store i32 20, ptr %2, align 4
  %11 = getelementptr inbounds nuw %class.anon, ptr %3, i32 0, i32 0
  %12 = load i32, ptr %1, align 4
  store i32 %12, ptr %11, align 4
  %13 = getelementptr inbounds nuw %class.anon, ptr %3, i32 0, i32 1
  %14 = load i32, ptr %2, align 4
  store i32 %14, ptr %13, align 4
  %15 = getelementptr inbounds nuw %class.anon.0, ptr %4, i32 0, i32 0
  store ptr %1, ptr %15, align 8
  %16 = getelementptr inbounds nuw %class.anon.0, ptr %4, i32 0, i32 1
  store ptr %2, ptr %16, align 8
  %17 = getelementptr inbounds nuw %class.anon.1, ptr %5, i32 0, i32 0
  %18 = load i32, ptr %1, align 4
  store i32 %18, ptr %17, align 4
  %19 = getelementptr inbounds nuw %class.anon.1, ptr %5, i32 0, i32 1
  %20 = load i32, ptr %2, align 4
  store i32 %20, ptr %19, align 4
  %21 = getelementptr inbounds nuw %class.anon.2, ptr %6, i32 0, i32 0
  store ptr %2, ptr %21, align 8
  %22 = getelementptr inbounds nuw %class.anon.2, ptr %6, i32 0, i32 1
  %23 = load i32, ptr %1, align 4
  store i32 %23, ptr %22, align 8
  %24 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str)
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %24, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.1)
  %27 = load i32, ptr %1, align 4
  %28 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %26, i32 noundef %27)
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %28, ptr noundef @.str.2)
  %30 = load i32, ptr %2, align 4
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %29, i32 noundef %30)
  %32 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %31, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %33 = call noundef i32 @"_ZZ23lambda_capture_analysisvENK3$_0clEi"(ptr noundef nonnull align 4 dereferenceable(8) %3, i32 noundef 3)
  store i32 %33, ptr %7, align 4
  %34 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.3)
  %35 = load i32, ptr %7, align 4
  %36 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %34, i32 noundef %35)
  %37 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %36, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %38 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.4)
  %39 = load i32, ptr %1, align 4
  %40 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %38, i32 noundef %39)
  %41 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %40, ptr noundef @.str.2)
  %42 = load i32, ptr %2, align 4
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %41, i32 noundef %42)
  %44 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %43, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %45 = call noundef i32 @"_ZZ23lambda_capture_analysisvENK3$_1clEi"(ptr noundef nonnull align 8 dereferenceable(16) %4, i32 noundef 5)
  store i32 %45, ptr %8, align 4
  %46 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.5)
  %47 = load i32, ptr %8, align 4
  %48 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %46, i32 noundef %47)
  %49 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %48, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %50 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.6)
  %51 = load i32, ptr %1, align 4
  %52 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %50, i32 noundef %51)
  %53 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %52, ptr noundef @.str.2)
  %54 = load i32, ptr %2, align 4
  %55 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %53, i32 noundef %54)
  %56 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %55, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %57 = call noundef i32 @"_ZZ23lambda_capture_analysisvEN3$_2clEi"(ptr noundef nonnull align 4 dereferenceable(8) %5, i32 noundef 2)
  store i32 %57, ptr %9, align 4
  %58 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.7)
  %59 = load i32, ptr %9, align 4
  %60 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %58, i32 noundef %59)
  %61 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %60, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %62 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.8)
  %63 = load i32, ptr %1, align 4
  %64 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %62, i32 noundef %63)
  %65 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %64, ptr noundef @.str.2)
  %66 = load i32, ptr %2, align 4
  %67 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %65, i32 noundef %66)
  %68 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %67, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %69 = call noundef i32 @"_ZZ23lambda_capture_analysisvENK3$_3clEi"(ptr noundef nonnull align 8 dereferenceable(12) %6, i32 noundef 4)
  store i32 %69, ptr %10, align 4
  %70 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.9)
  %71 = load i32, ptr %10, align 4
  %72 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %70, i32 noundef %71)
  %73 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %72, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %74 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.10)
  %75 = load i32, ptr %1, align 4
  %76 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %74, i32 noundef %75)
  %77 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %76, ptr noundef @.str.2)
  %78 = load i32, ptr %2, align 4
  %79 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %77, i32 noundef %78)
  %80 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8) %79, ptr noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret void
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEPFRSoS_E(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(ptr noundef nonnull align 8 dereferenceable(8)) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @"_ZZ23lambda_capture_analysisvENK3$_0clEi"(ptr noundef nonnull align 4 dereferenceable(8) %0, i32 noundef %1) #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %class.anon, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  %9 = mul nsw i32 %7, %8
  %10 = getelementptr inbounds nuw %class.anon, ptr %5, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %9, %11
  ret i32 %12
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @"_ZZ23lambda_capture_analysisvENK3$_1clEi"(ptr noundef nonnull align 8 dereferenceable(16) %0, i32 noundef %1) #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds nuw %class.anon.0, ptr %5, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %9, %6
  store i32 %10, ptr %8, align 4
  %11 = load i32, ptr %4, align 4
  %12 = getelementptr inbounds nuw %class.anon.0, ptr %5, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, %11
  store i32 %15, ptr %13, align 4
  %16 = getelementptr inbounds nuw %class.anon.0, ptr %5, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %17, align 4
  %19 = getelementptr inbounds nuw %class.anon.0, ptr %5, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %18, %21
  ret i32 %22
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @"_ZZ23lambda_capture_analysisvEN3$_2clEi"(ptr noundef nonnull align 4 dereferenceable(8) %0, i32 noundef %1) #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds nuw %class.anon.1, ptr %5, i32 0, i32 0
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %8, %6
  store i32 %9, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  %11 = getelementptr inbounds nuw %class.anon.1, ptr %5, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, %10
  store i32 %13, ptr %11, align 4
  %14 = getelementptr inbounds nuw %class.anon.1, ptr %5, i32 0, i32 0
  %15 = load i32, ptr %14, align 4
  %16 = getelementptr inbounds nuw %class.anon.1, ptr %5, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = mul nsw i32 %15, %17
  ret i32 %18
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @"_ZZ23lambda_capture_analysisvENK3$_3clEi"(ptr noundef nonnull align 8 dereferenceable(12) %0, i32 noundef %1) #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %class.anon.2, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = load i32, ptr %4, align 4
  %9 = mul nsw i32 %7, %8
  %10 = getelementptr inbounds nuw %class.anon.2, ptr %5, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %9, %12
  ret i32 %13
}

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main() #3 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @_Z23lambda_capture_analysisv()
  ret i32 0
}

attributes #0 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1)"}
