import pandas as pd

def activity_level(df, window):
    df[['first_log_date', 'logged_date']] = df[['first_logged_at', 'logged_at']].values.astype('datetime64[D]')
    df.drop_duplicates(subset=['email', 'logged_date'], keep='first', inplace=True)
    
    time_window = (df['first_log_date'] + timedelta(days=window))
    members = df['membership_id'].nunique()
    act_level = df[df['logged_date']<time_window]['logged_date'].count()
    return act_level/members