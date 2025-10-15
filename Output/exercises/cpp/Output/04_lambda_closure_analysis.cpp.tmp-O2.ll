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

; Function Attrs: mustprogress uwtable
define dso_local void @_Z23lambda_capture_analysisv() local_unnamed_addr #0 {
  %1 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str, i64 noundef 31)
  %2 = load ptr, ptr @_ZSt4cout, align 8, !tbaa !5
  %3 = getelementptr i8, ptr %2, i64 -24
  %4 = load i64, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr @_ZSt4cout, i64 %4
  %6 = getelementptr inbounds nuw i8, ptr %5, i64 240
  %7 = load ptr, ptr %6, align 8, !tbaa !8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %0
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

10:                                               ; preds = %0
  %11 = getelementptr inbounds nuw i8, ptr %7, i64 56
  %12 = load i8, ptr %11, align 8, !tbaa !28
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds nuw i8, ptr %7, i64 67
  %16 = load i8, ptr %15, align 1, !tbaa !34
  br label %22

17:                                               ; preds = %10
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %7)
  %18 = load ptr, ptr %7, align 8, !tbaa !5
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 48
  %20 = load ptr, ptr %19, align 8
  %21 = tail call noundef signext i8 %20(ptr noundef nonnull align 8 dereferenceable(570) %7, i8 noundef signext 10)
  br label %22

22:                                               ; preds = %14, %17
  %23 = phi i8 [ %16, %14 ], [ %21, %17 ]
  %24 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i8 noundef signext %23)
  %25 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %24)
  %26 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.1, i64 noundef 19)
  %27 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 10)
  %28 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %27, ptr noundef nonnull @.str.2, i64 noundef 4)
  %29 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %27, i32 noundef 20)
  %30 = load ptr, ptr %29, align 8, !tbaa !5
  %31 = getelementptr i8, ptr %30, i64 -24
  %32 = load i64, ptr %31, align 8
  %33 = getelementptr inbounds i8, ptr %29, i64 %32
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 240
  %35 = load ptr, ptr %34, align 8, !tbaa !8
  %36 = icmp eq ptr %35, null
  br i1 %36, label %37, label %38

37:                                               ; preds = %22
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

38:                                               ; preds = %22
  %39 = getelementptr inbounds nuw i8, ptr %35, i64 56
  %40 = load i8, ptr %39, align 8, !tbaa !28
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %45, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds nuw i8, ptr %35, i64 67
  %44 = load i8, ptr %43, align 1, !tbaa !34
  br label %50

45:                                               ; preds = %38
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %35)
  %46 = load ptr, ptr %35, align 8, !tbaa !5
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 48
  %48 = load ptr, ptr %47, align 8
  %49 = tail call noundef signext i8 %48(ptr noundef nonnull align 8 dereferenceable(570) %35, i8 noundef signext 10)
  br label %50

50:                                               ; preds = %42, %45
  %51 = phi i8 [ %44, %42 ], [ %49, %45 ]
  %52 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %29, i8 noundef signext %51)
  %53 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %52)
  %54 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.3, i64 noundef 16)
  %55 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 50)
  %56 = load ptr, ptr %55, align 8, !tbaa !5
  %57 = getelementptr i8, ptr %56, i64 -24
  %58 = load i64, ptr %57, align 8
  %59 = getelementptr inbounds i8, ptr %55, i64 %58
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 240
  %61 = load ptr, ptr %60, align 8, !tbaa !8
  %62 = icmp eq ptr %61, null
  br i1 %62, label %63, label %64

63:                                               ; preds = %50
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

64:                                               ; preds = %50
  %65 = getelementptr inbounds nuw i8, ptr %61, i64 56
  %66 = load i8, ptr %65, align 8, !tbaa !28
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %71, label %68

68:                                               ; preds = %64
  %69 = getelementptr inbounds nuw i8, ptr %61, i64 67
  %70 = load i8, ptr %69, align 1, !tbaa !34
  br label %76

71:                                               ; preds = %64
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %61)
  %72 = load ptr, ptr %61, align 8, !tbaa !5
  %73 = getelementptr inbounds nuw i8, ptr %72, i64 48
  %74 = load ptr, ptr %73, align 8
  %75 = tail call noundef signext i8 %74(ptr noundef nonnull align 8 dereferenceable(570) %61, i8 noundef signext 10)
  br label %76

76:                                               ; preds = %68, %71
  %77 = phi i8 [ %70, %68 ], [ %75, %71 ]
  %78 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %55, i8 noundef signext %77)
  %79 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %78)
  %80 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.4, i64 noundef 17)
  %81 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 10)
  %82 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %81, ptr noundef nonnull @.str.2, i64 noundef 4)
  %83 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %81, i32 noundef 20)
  %84 = load ptr, ptr %83, align 8, !tbaa !5
  %85 = getelementptr i8, ptr %84, i64 -24
  %86 = load i64, ptr %85, align 8
  %87 = getelementptr inbounds i8, ptr %83, i64 %86
  %88 = getelementptr inbounds nuw i8, ptr %87, i64 240
  %89 = load ptr, ptr %88, align 8, !tbaa !8
  %90 = icmp eq ptr %89, null
  br i1 %90, label %91, label %92

91:                                               ; preds = %76
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

92:                                               ; preds = %76
  %93 = getelementptr inbounds nuw i8, ptr %89, i64 56
  %94 = load i8, ptr %93, align 8, !tbaa !28
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %99, label %96

96:                                               ; preds = %92
  %97 = getelementptr inbounds nuw i8, ptr %89, i64 67
  %98 = load i8, ptr %97, align 1, !tbaa !34
  br label %104

99:                                               ; preds = %92
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %89)
  %100 = load ptr, ptr %89, align 8, !tbaa !5
  %101 = getelementptr inbounds nuw i8, ptr %100, i64 48
  %102 = load ptr, ptr %101, align 8
  %103 = tail call noundef signext i8 %102(ptr noundef nonnull align 8 dereferenceable(570) %89, i8 noundef signext 10)
  br label %104

104:                                              ; preds = %96, %99
  %105 = phi i8 [ %98, %96 ], [ %103, %99 ]
  %106 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %83, i8 noundef signext %105)
  %107 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %106)
  %108 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.5, i64 noundef 16)
  %109 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 40)
  %110 = load ptr, ptr %109, align 8, !tbaa !5
  %111 = getelementptr i8, ptr %110, i64 -24
  %112 = load i64, ptr %111, align 8
  %113 = getelementptr inbounds i8, ptr %109, i64 %112
  %114 = getelementptr inbounds nuw i8, ptr %113, i64 240
  %115 = load ptr, ptr %114, align 8, !tbaa !8
  %116 = icmp eq ptr %115, null
  br i1 %116, label %117, label %118

117:                                              ; preds = %104
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

118:                                              ; preds = %104
  %119 = getelementptr inbounds nuw i8, ptr %115, i64 56
  %120 = load i8, ptr %119, align 8, !tbaa !28
  %121 = icmp eq i8 %120, 0
  br i1 %121, label %125, label %122

122:                                              ; preds = %118
  %123 = getelementptr inbounds nuw i8, ptr %115, i64 67
  %124 = load i8, ptr %123, align 1, !tbaa !34
  br label %130

125:                                              ; preds = %118
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %115)
  %126 = load ptr, ptr %115, align 8, !tbaa !5
  %127 = getelementptr inbounds nuw i8, ptr %126, i64 48
  %128 = load ptr, ptr %127, align 8
  %129 = tail call noundef signext i8 %128(ptr noundef nonnull align 8 dereferenceable(570) %115, i8 noundef signext 10)
  br label %130

130:                                              ; preds = %122, %125
  %131 = phi i8 [ %124, %122 ], [ %129, %125 ]
  %132 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %109, i8 noundef signext %131)
  %133 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %132)
  %134 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.6, i64 noundef 17)
  %135 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 15)
  %136 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %135, ptr noundef nonnull @.str.2, i64 noundef 4)
  %137 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %135, i32 noundef 25)
  %138 = load ptr, ptr %137, align 8, !tbaa !5
  %139 = getelementptr i8, ptr %138, i64 -24
  %140 = load i64, ptr %139, align 8
  %141 = getelementptr inbounds i8, ptr %137, i64 %140
  %142 = getelementptr inbounds nuw i8, ptr %141, i64 240
  %143 = load ptr, ptr %142, align 8, !tbaa !8
  %144 = icmp eq ptr %143, null
  br i1 %144, label %145, label %146

145:                                              ; preds = %130
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

146:                                              ; preds = %130
  %147 = getelementptr inbounds nuw i8, ptr %143, i64 56
  %148 = load i8, ptr %147, align 8, !tbaa !28
  %149 = icmp eq i8 %148, 0
  br i1 %149, label %153, label %150

150:                                              ; preds = %146
  %151 = getelementptr inbounds nuw i8, ptr %143, i64 67
  %152 = load i8, ptr %151, align 1, !tbaa !34
  br label %158

153:                                              ; preds = %146
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %143)
  %154 = load ptr, ptr %143, align 8, !tbaa !5
  %155 = getelementptr inbounds nuw i8, ptr %154, i64 48
  %156 = load ptr, ptr %155, align 8
  %157 = tail call noundef signext i8 %156(ptr noundef nonnull align 8 dereferenceable(570) %143, i8 noundef signext 10)
  br label %158

158:                                              ; preds = %150, %153
  %159 = phi i8 [ %152, %150 ], [ %157, %153 ]
  %160 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %137, i8 noundef signext %159)
  %161 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %160)
  %162 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.7, i64 noundef 16)
  %163 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 264)
  %164 = load ptr, ptr %163, align 8, !tbaa !5
  %165 = getelementptr i8, ptr %164, i64 -24
  %166 = load i64, ptr %165, align 8
  %167 = getelementptr inbounds i8, ptr %163, i64 %166
  %168 = getelementptr inbounds nuw i8, ptr %167, i64 240
  %169 = load ptr, ptr %168, align 8, !tbaa !8
  %170 = icmp eq ptr %169, null
  br i1 %170, label %171, label %172

171:                                              ; preds = %158
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

172:                                              ; preds = %158
  %173 = getelementptr inbounds nuw i8, ptr %169, i64 56
  %174 = load i8, ptr %173, align 8, !tbaa !28
  %175 = icmp eq i8 %174, 0
  br i1 %175, label %179, label %176

176:                                              ; preds = %172
  %177 = getelementptr inbounds nuw i8, ptr %169, i64 67
  %178 = load i8, ptr %177, align 1, !tbaa !34
  br label %184

179:                                              ; preds = %172
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %169)
  %180 = load ptr, ptr %169, align 8, !tbaa !5
  %181 = getelementptr inbounds nuw i8, ptr %180, i64 48
  %182 = load ptr, ptr %181, align 8
  %183 = tail call noundef signext i8 %182(ptr noundef nonnull align 8 dereferenceable(570) %169, i8 noundef signext 10)
  br label %184

184:                                              ; preds = %176, %179
  %185 = phi i8 [ %178, %176 ], [ %183, %179 ]
  %186 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %163, i8 noundef signext %185)
  %187 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %186)
  %188 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.8, i64 noundef 17)
  %189 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 15)
  %190 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %189, ptr noundef nonnull @.str.2, i64 noundef 4)
  %191 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %189, i32 noundef 25)
  %192 = load ptr, ptr %191, align 8, !tbaa !5
  %193 = getelementptr i8, ptr %192, i64 -24
  %194 = load i64, ptr %193, align 8
  %195 = getelementptr inbounds i8, ptr %191, i64 %194
  %196 = getelementptr inbounds nuw i8, ptr %195, i64 240
  %197 = load ptr, ptr %196, align 8, !tbaa !8
  %198 = icmp eq ptr %197, null
  br i1 %198, label %199, label %200

199:                                              ; preds = %184
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

200:                                              ; preds = %184
  %201 = getelementptr inbounds nuw i8, ptr %197, i64 56
  %202 = load i8, ptr %201, align 8, !tbaa !28
  %203 = icmp eq i8 %202, 0
  br i1 %203, label %207, label %204

204:                                              ; preds = %200
  %205 = getelementptr inbounds nuw i8, ptr %197, i64 67
  %206 = load i8, ptr %205, align 1, !tbaa !34
  br label %212

207:                                              ; preds = %200
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %197)
  %208 = load ptr, ptr %197, align 8, !tbaa !5
  %209 = getelementptr inbounds nuw i8, ptr %208, i64 48
  %210 = load ptr, ptr %209, align 8
  %211 = tail call noundef signext i8 %210(ptr noundef nonnull align 8 dereferenceable(570) %197, i8 noundef signext 10)
  br label %212

212:                                              ; preds = %204, %207
  %213 = phi i8 [ %206, %204 ], [ %211, %207 ]
  %214 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %191, i8 noundef signext %213)
  %215 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %214)
  %216 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.9, i64 noundef 16)
  %217 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 65)
  %218 = load ptr, ptr %217, align 8, !tbaa !5
  %219 = getelementptr i8, ptr %218, i64 -24
  %220 = load i64, ptr %219, align 8
  %221 = getelementptr inbounds i8, ptr %217, i64 %220
  %222 = getelementptr inbounds nuw i8, ptr %221, i64 240
  %223 = load ptr, ptr %222, align 8, !tbaa !8
  %224 = icmp eq ptr %223, null
  br i1 %224, label %225, label %226

225:                                              ; preds = %212
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

226:                                              ; preds = %212
  %227 = getelementptr inbounds nuw i8, ptr %223, i64 56
  %228 = load i8, ptr %227, align 8, !tbaa !28
  %229 = icmp eq i8 %228, 0
  br i1 %229, label %233, label %230

230:                                              ; preds = %226
  %231 = getelementptr inbounds nuw i8, ptr %223, i64 67
  %232 = load i8, ptr %231, align 1, !tbaa !34
  br label %238

233:                                              ; preds = %226
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %223)
  %234 = load ptr, ptr %223, align 8, !tbaa !5
  %235 = getelementptr inbounds nuw i8, ptr %234, i64 48
  %236 = load ptr, ptr %235, align 8
  %237 = tail call noundef signext i8 %236(ptr noundef nonnull align 8 dereferenceable(570) %223, i8 noundef signext 10)
  br label %238

238:                                              ; preds = %230, %233
  %239 = phi i8 [ %232, %230 ], [ %237, %233 ]
  %240 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %217, i8 noundef signext %239)
  %241 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %240)
  %242 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.10, i64 noundef 17)
  %243 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i32 noundef 15)
  %244 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %243, ptr noundef nonnull @.str.2, i64 noundef 4)
  %245 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8) %243, i32 noundef 25)
  %246 = load ptr, ptr %245, align 8, !tbaa !5
  %247 = getelementptr i8, ptr %246, i64 -24
  %248 = load i64, ptr %247, align 8
  %249 = getelementptr inbounds i8, ptr %245, i64 %248
  %250 = getelementptr inbounds nuw i8, ptr %249, i64 240
  %251 = load ptr, ptr %250, align 8, !tbaa !8
  %252 = icmp eq ptr %251, null
  br i1 %252, label %253, label %254

253:                                              ; preds = %238
  tail call void @_ZSt16__throw_bad_castv() #4
  unreachable

254:                                              ; preds = %238
  %255 = getelementptr inbounds nuw i8, ptr %251, i64 56
  %256 = load i8, ptr %255, align 8, !tbaa !28
  %257 = icmp eq i8 %256, 0
  br i1 %257, label %261, label %258

258:                                              ; preds = %254
  %259 = getelementptr inbounds nuw i8, ptr %251, i64 67
  %260 = load i8, ptr %259, align 1, !tbaa !34
  br label %266

261:                                              ; preds = %254
  tail call void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570) %251)
  %262 = load ptr, ptr %251, align 8, !tbaa !5
  %263 = getelementptr inbounds nuw i8, ptr %262, i64 48
  %264 = load ptr, ptr %263, align 8
  %265 = tail call noundef signext i8 %264(ptr noundef nonnull align 8 dereferenceable(570) %251, i8 noundef signext 10)
  br label %266

266:                                              ; preds = %258, %261
  %267 = phi i8 [ %260, %258 ], [ %265, %261 ]
  %268 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8) %245, i8 noundef signext %267)
  %269 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %268)
  ret void
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) local_unnamed_addr #1

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #2 {
  tail call void @_Z23lambda_capture_analysisv()
  ret i32 0
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) local_unnamed_addr #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #1

; Function Attrs: cold noreturn
declare void @_ZSt16__throw_bad_castv() local_unnamed_addr #3

declare void @_ZNKSt5ctypeIcE13_M_widen_initEv(ptr noundef nonnull align 8 dereferenceable(570)) local_unnamed_addr #1

attributes #0 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold noreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"vtable pointer", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !25, i64 240}
!9 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !10, i64 0, !22, i64 216, !12, i64 224, !23, i64 225, !24, i64 232, !25, i64 240, !26, i64 248, !27, i64 256}
!10 = !{!"_ZTSSt8ios_base", !11, i64 8, !11, i64 16, !13, i64 24, !14, i64 28, !14, i64 32, !15, i64 40, !17, i64 48, !12, i64 64, !18, i64 192, !19, i64 200, !20, i64 208}
!11 = !{!"long", !12, i64 0}
!12 = !{!"omnipotent char", !7, i64 0}
!13 = !{!"_ZTSSt13_Ios_Fmtflags", !12, i64 0}
!14 = !{!"_ZTSSt12_Ios_Iostate", !12, i64 0}
!15 = !{!"p1 _ZTSNSt8ios_base14_Callback_listE", !16, i64 0}
!16 = !{!"any pointer", !12, i64 0}
!17 = !{!"_ZTSNSt8ios_base6_WordsE", !16, i64 0, !11, i64 8}
!18 = !{!"int", !12, i64 0}
!19 = !{!"p1 _ZTSNSt8ios_base6_WordsE", !16, i64 0}
!20 = !{!"_ZTSSt6locale", !21, i64 0}
!21 = !{!"p1 _ZTSNSt6locale5_ImplE", !16, i64 0}
!22 = !{!"p1 _ZTSSo", !16, i64 0}
!23 = !{!"bool", !12, i64 0}
!24 = !{!"p1 _ZTSSt15basic_streambufIcSt11char_traitsIcEE", !16, i64 0}
!25 = !{!"p1 _ZTSSt5ctypeIcE", !16, i64 0}
!26 = !{!"p1 _ZTSSt7num_putIcSt19ostreambuf_iteratorIcSt11char_traitsIcEEE", !16, i64 0}
!27 = !{!"p1 _ZTSSt7num_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE", !16, i64 0}
!28 = !{!29, !12, i64 56}
!29 = !{!"_ZTSSt5ctypeIcE", !30, i64 0, !31, i64 16, !23, i64 24, !32, i64 32, !32, i64 40, !33, i64 48, !12, i64 56, !12, i64 57, !12, i64 313, !12, i64 569}
!30 = !{!"_ZTSNSt6locale5facetE", !18, i64 8}
!31 = !{!"p1 _ZTS15__locale_struct", !16, i64 0}
!32 = !{!"p1 int", !16, i64 0}
!33 = !{!"p1 short", !16, i64 0}
!34 = !{!12, !12, i64 0}
