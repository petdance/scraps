#!/usr/bin/perl
#
$VAR1 = bless( {
        '_attachments' => [],
        'state' => {
            'cc' => '',
            'changetime' => '2011-10-25 05:42:43+00:00',
            'component' => 'none',
            'description' => 'This is a scratch ticket for Andy\'s testing.',
            'id' => '2201',
            'keywords' => '',
            'milestone' => '',
            'owner' => 'petdance',
            'priority' => 'normal',
            'reporter' => 'petdance',
            'resolution' => '--',
            'severity' => 'medium',
            'status' => 'assigned',
            'summary' => 'This product has only a moose, not a pony',
            'time' => '2011-10-25 04:51:41+00:00',
            'type' => 'bug',
            'version' => '3.8.0'
        }
    }, 'Net::Trac::Ticket' );
$VAR1 = bless( {
        'entries' => [
            bless( {
                    'author' => 'petdance',
                    'category' => 'Ticket',
                    'connection' => $VAR1->{'connection'},
                    'content' => 'Ticket created',
                    'date' => bless( {
                            'formatter' => undef,
                            'local_c' => {
                                'day' => 25,
                                'day_of_quarter' => 25,
                                'day_of_week' => 2,
                                'day_of_year' => 298,
                                'hour' => 4,
                                'minute' => 51,
                                'month' => 10,
                                'quarter' => 4,
                                'second' => 41,
                                'year' => 2011
                            },
                            'local_rd_days' => 734435,
                            'local_rd_secs' => 17501,
                            'locale' => bless( {
                                    'default_date_format_length' => 'medium',
                                    'default_time_format_length' => 'medium',
                                    'en_complete_name' => 'English United States',
                                    'en_language' => 'English',
                                    'en_territory' => 'United States',
                                    'id' => 'en_US',
                                    'native_complete_name' => 'English United States',
                                    'native_language' => 'English',
                                    'native_territory' => 'United States'
                                }, 'DateTime::Locale::en_US' ),
                            'offset_modifier' => 0,
                            'rd_nanosecs' => 0,
                            'tz' => bless( {
                                    'name' => 'UTC'
                                }, 'DateTime::TimeZone::UTC' ),
                            'utc_rd_days' => 734435,
                            'utc_rd_secs' => 17501,
                            'utc_year' => 2012
                        }, 'DateTime' ),
                    'is_create' => 1,
                    'ticket' => bless( {
                            '_attachments' => [],
                            'connection' => $VAR1->{'connection'},
                            'history' => $VAR1,
                            'state' => {
                                'cc' => '',
                                'changetime' => '2011-10-25 05:42:43+00:00',
                                'component' => 'none',
                                'description' => 'This is a scratch ticket for Andy\'s testing.',
                                'id' => '2201',
                                'keywords' => '',
                                'milestone' => '',
                                'owner' => 'petdance',
                                'priority' => 'normal',
                                'reporter' => 'petdance',
                                'resolution' => '--',
                                'severity' => 'medium',
                                'status' => 'assigned',
                                'summary' => 'This product has only a moose, not a pony',
                                'time' => '2011-10-25 04:51:41+00:00',
                                'type' => 'bug',
                                'version' => '3.8.0'
                            }
                        }, 'Net::Trac::Ticket' )
                }, 'Net::Trac::TicketHistoryEntry' ),
            bless( {
                    'author' => 'petdance',
                    'category' => 'Ticket',
                    'connection' => $VAR1->{'connection'},
                    'content' => '
                    <p>
                    Ignore this ticket.  It\'s a test for conversion.
                    </p>',
                    'date' => bless( {
                            'formatter' => undef,
                            'local_c' => {
                                'day' => 25,
                                'day_of_quarter' => 25,
                                'day_of_week' => 2,
                                'day_of_year' => 298,
                                'hour' => 4,
                                'minute' => 52,
                                'month' => 10,
                                'quarter' => 4,
                                'second' => 36,
                                'year' => 2011
                            },
                            'local_rd_days' => 734435,
                            'local_rd_secs' => 17556,
                            'locale' => $VAR1->{'entries'}[0]{'date'}{'locale'},
                            'offset_modifier' => 0,
                            'rd_nanosecs' => 0,
                            'tz' => $VAR1->{'entries'}[0]{'date'}{'tz'},
                            'utc_rd_days' => 734435,
                            'utc_rd_secs' => 17556,
                            'utc_year' => 2012
                        }, 'DateTime' ),
                    'is_create' => 0,
                    'prop_changes' => {},
                    'ticket' => $VAR1->{'entries'}[0]{'ticket'}
                }, 'Net::Trac::TicketHistoryEntry' ),
            bless( {
                    'author' => 'petdance',
                    'category' => 'Ticket',
                    'connection' => $VAR1->{'connection'},
                    'content' => '',
                    'date' => bless( {
                            'formatter' => undef,
                            'local_c' => {
                                'day' => 25,
                                'day_of_quarter' => 25,
                                'day_of_week' => 2,
                                'day_of_year' => 298,
                                'hour' => 5,
                                'minute' => 34,
                                'month' => 10,
                                'quarter' => 4,
                                'second' => 22,
                                'year' => 2011
                            },
                            'local_rd_days' => 734435,
                            'local_rd_secs' => 20062,
                            'locale' => $VAR1->{'entries'}[0]{'date'}{'locale'},
                            'offset_modifier' => 0,
                            'rd_nanosecs' => 0,
                            'tz' => $VAR1->{'entries'}[0]{'date'}{'tz'},
                            'utc_rd_days' => 734435,
                            'utc_rd_secs' => 20062,
                            'utc_year' => 2012
                        }, 'DateTime' ),
                    'is_create' => 0,
                    'prop_changes' => {},
                    'ticket' => $VAR1->{'entries'}[0]{'ticket'}
                }, 'Net::Trac::TicketHistoryEntry' ),
            bless( {
                    'author' => 'petdance',
                    'category' => 'Ticket',
                    'connection' => $VAR1->{'connection'},
                    'content' => '',
                    'date' => bless( {
                            'formatter' => undef,
                            'local_c' => {
                                'day' => 25,
                                'day_of_quarter' => 25,
                                'day_of_week' => 2,
                                'day_of_year' => 298,
                                'hour' => 5,
                                'minute' => 34,
                                'month' => 10,
                                'quarter' => 4,
                                'second' => 27,
                                'year' => 2011
                            },
                            'local_rd_days' => 734435,
                            'local_rd_secs' => 20067,
                            'locale' => $VAR1->{'entries'}[0]{'date'}{'locale'},
                            'offset_modifier' => 0,
                            'rd_nanosecs' => 0,
                            'tz' => $VAR1->{'entries'}[0]{'date'}{'tz'},
                            'utc_rd_days' => 734435,
                            'utc_rd_secs' => 20067,
                            'utc_year' => 2012
                        }, 'DateTime' ),
                    'is_create' => 0,
                    'prop_changes' => {
                        'owner' => bless( {
                                'new_value' => 'petdance',
                                'old_value' => '',
                                'property' => 'owner'
                            }, 'Net::Trac::TicketPropChange' )
                    },
                    'ticket' => $VAR1->{'entries'}[0]{'ticket'}
                }, 'Net::Trac::TicketHistoryEntry' ),
            bless( {
                    'author' => 'petdance',
                    'category' => 'Ticket',
                    'connection' => $VAR1->{'connection'},
                    'content' => '',
                    'date' => bless( {
                            'formatter' => undef,
                            'local_c' => {
                                'day' => 25,
                                'day_of_quarter' => 25,
                                'day_of_week' => 2,
                                'day_of_year' => 298,
                                'hour' => 5,
                                'minute' => 42,
                                'month' => 10,
                                'quarter' => 4,
                                'second' => 43,
                                'year' => 2011
                            },
                            'local_rd_days' => 734435,
                            'local_rd_secs' => 20563,
                            'locale' => $VAR1->{'entries'}[0]{'date'}{'locale'},
                            'offset_modifier' => 0,
                            'rd_nanosecs' => 0,
                            'tz' => $VAR1->{'entries'}[0]{'date'}{'tz'},
                            'utc_rd_days' => 734435,
                            'utc_rd_secs' => 20563,
                            'utc_year' => 2012
                        }, 'DateTime' ),
                    'is_create' => 0,
                    'prop_changes' => {
                        'status' => bless( {
                                'new_value' => 'assigned',
                                'old_value' => 'new',
                                'property' => 'status'
                            }, 'Net::Trac::TicketPropChange' )
                    },
                    'ticket' => $VAR1->{'entries'}[0]{'ticket'}
                }, 'Net::Trac::TicketHistoryEntry' )
        ],
        'ticket' => $VAR1->{'entries'}[0]{'ticket'}
    }, 'Net::Trac::TicketHistory' );
