package lee.bowon.holiday

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.net.Uri
import android.util.Log
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetPlugin
import es.antonborri.home_widget.actionStartActivity
import org.w3c.dom.Text
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.TextStyle

/**
 * Implementation of App Widget functionality.
 */
class SingleDueDateWidget : AppWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        // There may be multiple widgets active, so update all of them
        for (appWidgetId in appWidgetIds) {
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.single_due_date_widget).apply {

                val title = widgetData.getString("title", "No title set")
                val date = widgetData.getString("date", "")

                val parsedDate = LocalDateTime.parse(date)

                setTextViewText(R.id.title, title)
                setTextViewText(R.id.date, parsedDate.format(DateTimeFormatter.ofPattern("yyyy MM dd")))
                val pendingIntentWithData = HomeWidgetLaunchIntent.getActivity(
                        context,
                        MainActivity::class.java,
                        Uri.parse("homeWidgetExample://message?message=$title"))
                setOnClickPendingIntent(R.id.title, pendingIntentWithData)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }


    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }

    fun getDueDateFromNow(targetDate: LocalDateTime) {

    }
}

internal fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: Int) {
    val widgetText = context.getString(R.string.appwidget_text)
    // Construct the RemoteViews object
    val views = RemoteViews(context.packageName, R.layout.single_due_date_widget)
    views.setTextViewText(R.id.title, widgetText)

    // Instruct the widget manager to update the widget
    appWidgetManager.updateAppWidget(appWidgetId, views)
}