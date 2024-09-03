(* Exercise 1 *)


fun is_older (date1: int*int*int, date2: int*int*int) = 
        ((#3 date1) < (#3 date2)) orelse ((#3 date1) = (#3 date2) andalso (#2 date1) < (#2 date2)) orelse ((#3 date1) = (#3 date2) andalso (#2 date1) = (#2 date2) andalso (#1 date1) < (#1 date2))

fun number_in_month (list_of_dates: (int*int*int) list, month: int) = 
        if null list_of_dates
        then 0
        else if #2 (hd list_of_dates) = month
        then 1 + number_in_month(tl list_of_dates, month)
        else number_in_month(tl list_of_dates, month)

fun number_in_months (list_of_dates: (int*int*int) list, list_of_months: int list) =
        if null list_of_months
        then 0
        else number_in_month(list_of_dates, hd list_of_months) + number_in_months(list_of_dates, tl list_of_months)

fun dates_in_month (list_of_dates: (int*int*int) list, month: int) = 
        if null list_of_dates
        then []
        else if #2 (hd list_of_dates) = month
        then hd list_of_dates :: dates_in_month(tl list_of_dates, month)
        else dates_in_month(tl list_of_dates, month)

fun get_nth (list_of_strings: string list, n: int) =
        if n = 1
        then hd list_of_strings
        else get_nth(tl list_of_strings, n-1)

fun date_to_string (date: int*int*int) = 
        let val months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
            val day = Int.toString(#1 date)
            val month = get_nth(months, #2 date)
            val year = Int.toString(#3 date)
        in  if #1 date < 10
            then month ^ " 0" ^ day ^ ", " ^ year
            else month ^ " " ^ day ^ ", " ^ year
        end

fun number_before_reaching (target: int, int_list: int list) = 
        if target - hd int_list > 0
        then 1 + number_before_reaching(target - hd int_list, tl int_list)
        else 1

fun what_month (day: int) = 
        let val months = [31,28,31,30,31,30,31,31,30,31,30,31]
        in number_before_reaching(day, months)
        end

fun month_range (day1: int, day2: int) = 
        let fun count (from: int, to: int) = 
                if from > to
                then []
                else from :: count(from + 1, to)
            val month1 = what_month(day1)
            val month2 = what_month(day2)
        in count(month1, month2)
        end

fun oldest (list_of_dates: (int*int*int) list) = 
        let val tail = tl list_of_dates
        in if null (tl tail) andalso is_older(hd list_of_dates, hd tail)
           then hd list_of_dates
           else if null (tl tail)
           then hd tail
           else if is_older(hd list_of_dates, hd tail)
           then oldest(hd list_of_dates :: tl tail)
           else oldest(tail)
        end

(* Exercise 1 tests *)

val result0 = is_older((1,1,2023), (1,1,2024)) (* true *)
val result1 = is_older((1,1,2023), (1,2,2023)) (* true *)
val result2 = is_older((1,1,2023), (2,1,2023)) (* true *)
val result3 = is_older((1,1,2023), (1,1,2023)) (* false *)
val result4 = is_older((1,1,2024), (1,1,2023)) (* false *)
val result5 = number_in_month([(1,1,2023),(1,2,2023),(3,1,2024)], 1) (* 2 *)
val result6 = number_in_month([(1,1,2023),(1,2,2023),(3,1,2024)], 7) (* 0 *)
val result7 = number_in_months([(1,1,2023),(1,5,2023),(1,2,2023),(20,2,2023)], [1,2,3]) (* 3 *)
val result8 = dates_in_month([(1,1,2023),(1,2,2023),(1,5,2023),(20,2,2023)], 2) (* [(1,2,2023),(20,2,2023)] *)
val result9 = get_nth(["hello","ece","msfea","334"], 3) (* "msfea" *)
val result10 = date_to_string (1,1,2023) (* "January 01, 2023" *)
val result11 = date_to_string (10,1,2023) (* "January 10, 2023" *)
val result12 = number_before_reaching(7, [1,2,3,10]) (* 4 *)
val result13 = what_month(89) (* 3 *)
val result14 = month_range(1, 330) (* [1,2,3,4,5,6,7,8,9,10,11] *)
val result15 = oldest([(1,1,2023),(1,2,2023),(1,5,2023),(20,2,2023)]) (* (1,1,2023) *)
val result16 = oldest([(1,1,2024),(1,2,2024),(1,5,2023),(20,2,2023)]) (* (20,2,2023) *)


(* Exercise 2 *)


fun invertRGBPixel (rgb_pixel: int*int*int) = 
        (255 - #1 rgb_pixel, 255 - #2 rgb_pixel, 255 - #3 rgb_pixel)

fun rgb2gray (rgb_pixel: int*int*int) =
        ((#1 rgb_pixel)*3 + (#2 rgb_pixel)*6 + #3 rgb_pixel) div 10

fun gray2bw (grayscale_pixel: int) = 
        if grayscale_pixel < 128
        then 0
        else 255

fun isBrighter (rgb_pixel1: int*int*int, rgb_pixel2: int*int*int) = 
        if rgb2gray(rgb_pixel1) > rgb2gray(rgb_pixel2)
        then true
        else false

fun invertImage (image: (int*int*int) list) =
        if null image
        then []
        else invertRGBPixel(hd image) :: invertImage(tl image)

fun rgb2grayImage (image: (int*int*int) list) =
        if null image
        then []
        else rgb2gray(hd image) :: rgb2grayImage(tl image)


fun getPixel (image: (int*int*int) list, i: int) =
        if i = 0
        then hd image
        else getPixel(tl image, i - 1)

fun countRedPixels (image: (int*int*int) list) = 
        if null image
        then []
        else if #1 (hd image) > #2 (hd image) andalso #1 (hd image) > #3 (hd image)
        then hd image :: countRedPixels(tl image)
        else countRedPixels(tl image)

fun countRedPixels (image) = 
        case image of
                [] => []
                | head :: tail => case head of
                                        (r, g, b) => if r > g andalso r > b
                                                     then head :: countRedPixels(tail)
                                                     else countRedPixels(tail)

fun getPixelsinBlueRange (image: (int*int*int) list, range: (int*int*int) list) = 
        if null image 
        then []
        else if #3 (hd image) > #3 (hd range) andalso #3 (hd image) < #3 (hd (tl range))
        then hd image :: getPixelsinBlueRange(tl image, range)
        else getPixelsinBlueRange(tl image, range)

fun countBluePixelsInBlueRange (image: (int*int*int) list, range: (int*int*int) list) = 
        if null image 
        then 0
        else if #3 (hd image) > #3 (hd range) andalso #3 (hd image) < #3 (hd (tl range))
        then 1 + countBluePixelsInBlueRange(tl image)
        else countBluePixelsInBlueRange(tl image)

fun countBluePixelsInBlueRange (image: (int*int*int) list, range: (int*int*int) list) =
        let fun count (image: (int*int*int) list, range = (int*int*int) list, acc: int) =
                if null image 
                then acc
                else if #3 (hd image) > #3 (hd range) andalso #3 (hd image) < #3 (hd (tl range))
                then countBluePixelsInBlueRange(tl image, acc+1)
                else countBluePixelsInBlueRange(tl image, acc)
        in count (image, range, 0)
        end

fun countBluePixelsInBlueRange (image, range) =
        let fun count (image, range, acc) =
                case range of
                          [] => acc
                        | (r, g, b) :: tail => case tail of
                                                  [] => acc
                                                | (r1, g1, g1) :: tail1 => case image of
                                                                          [] => acc
                                                                        | (r2, g2, b2) :: tail2 => if r2 > r andalso r2 < r1
                                                                                                   then count (tail2, range, acc + 1)
                                                                                                   else count (tail2, range, acc)
        in count (image, range, 0)
        end


fun brightest (image: (int*int*int) list) = 
        let val tail = tl image
        in if null (tl tail) andalso isBrighter(hd image, hd tail)
           then hd image
           else if null (tl tail)
           then hd tail
           else if isBrighter(hd image, hd tail)
           then brightest(hd image :: tl tail)
           else brightest(tail)
        end

fun countWhite (image_list: (int*int*int) list list) = 
        if null image_list
        then 0
        else if rgb2gray(brightest(hd image_list)) = 255
        then 1 + countWhite(tl image_list)
        else countWhite(tl image_list)

fun shrinkImage (grayscale_image: int list) = 
        if null grayscale_image
        then []
        else ((hd grayscale_image + hd (tl grayscale_image)) div 2) :: shrinkImage(tl (tl grayscale_image))

(* Exercise 2 tests *)

val result17 = invertRGBPixel(30,30,30) (* (225,225,225) *)
val result18 = rgb2gray(30,30,30) (* 30 *)
val result19 = rgb2gray(30,30,31) (* 30 *)
val result20 = gray2bw(120) (* 0 *)
val result21 = gray2bw(200) (* 255 *)
val result22 = isBrighter((30,30,30),(20,30,30)) (* true *)
val result23 = isBrighter((30,30,30),(40,30,30)) (* false *)
val result24 = invertImage([(30,30,30),(40,30,30),(20,20,30)]) (* [(225,225,225),(215,225,225),(235,235,225)] *)
val result25 = rgb2grayImage([(30,30,30),(40,30,30),(20,20,30)]) (* [30,33,21] *)
val result26 = brightest([(30,30,30),(40,30,30),(20,20,30)]) (* (40,30,30) *)
val result27 = countWhite([[(30,30,30),(40,30,30),(20,20,30)],[(30,30,30),(255,255,255),(20,20,30)],[(30,30,30),(40,30,30),(255,255,255)]]) (* 2 *)
val result28 = shrinkImage([30,10,80,60]) (* [20,70] *)

