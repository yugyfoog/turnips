
weekpoint <- function(weekday, ampm) {
    rv = 0
    if (weekday == "mon") {
        rv <- rv + 1
    }
    else if (weekday == "tue") {
        rv <- rv + 3
    }
    else if (weekday == "wed") {
        rv <- rv + 5
    }
    else if (weekday == "thur") {
        rv <- rv + 7
    }
    else if (weekday == "fri") {
        rv <- rv + 9
    }
    else if (weekday == "sat") {
        rv <- rv + 11
    }
    if (ampm == "pm") {
        rv <- rv + 1
    }
    return(rv)
}