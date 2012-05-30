package GH;

use base 'Exporter';

our @EXPORT = qw(
    username_translate
    github_usernames
);

sub _same {
    return map { ($_ => $_) } @_;
}

my %username_translate = (
    _same( qw(
        arnsholt
        bacek
        brianwisti
        bubaflub
        cconstantine
        chromatic
        coke
        colomon
        cotto
        dafrito
        darbelo
        diakopter
        donpdonp
        doughera
        Eclesia
        flh
        flussence
        fperrad
        gerd
        hanekomu
        Infinoid
        japhb
        jessevdam
        jkeenan
        jrtayloriv
        jsut
        kjs
        kthakore
        kurahaupo
        lateau
        ligne
        masak
        mberends
        mikehh
        mj41
        moritz
        nwellnhof
        ocharles
        particle
        petdance
        plobsing
        pmichaud
        pstumpf
        reezer
        rurban
        schwern
        ShaneC
        shockwave
        sorear
        tadzik
        tene
        tewk
        theory
        ujwal
        Util
        wagle
        wayland
        ) ),
    allison                                                               => 'allisonrandal',
    "Andy Dougherty <doughera\@\xE2\x80\xA6>"                             => 'doughera',
    ash                                                                   => 'ashgti',
    Austin                                                                => 'aghast',
    Austin_Hastings                                                       => 'aghast',
    'avarab'                                                              => 'avar',
    barney                                                                => 'bschmalhofer',
    benabik                                                               => 'Benabik',
    bluescreen                                                            => 'bluescreen10',
    "Daehyub Kim <lateau\@\xE2\x80\xA6>"                                  => 'lateau',
    dukeleto                                                              => 'leto',
    fbrito                                                                => 'fernandobrito',
    Felipe                                                                => 'felipensp',
    'francois.perrad'                                                     => 'fperrad',
    "jhoblitt\@\xE2\x80\xA6"                                              => 'jhoblitt',
    jimmy                                                                 => 'zhuomingliang',
    JoelSherrill                                                          => 'joelsherrill',
    jonathan                                                              => 'jnthn',
    'julian.notfound'                                                     => 'notfound',
    lucian                                                                => 'lucian1900',
    "Matthew Wilson <diakopter\@\xE2\x80\xA6>"                            => 'diakopter',
    NotFound                                                              => 'notfound',
    "Paul C. Anagnostopoulos"                                             => 'Paul-C-Anagnostopoulos',
    ronaldws                                                              => 'ronaldxs',
    soh_cah_toa                                                           => 'soh-cah-toa',
    tcurtis                                                               => 'ekiru',
    whiteknight                                                           => 'Whiteknight',
    "\xC3\x86var Arnfj\xC3\xB6r\xC3\xB0 Bjarmason <avarab\@\xE2\x80\xA6>" => 'avar',
    "Yuki`N"                                                              => 'nol888',
);

sub github_usernames {
    return values %username_translate;
}

sub username_translate {
    my $user = shift;

    return $username_translate{ $user };
}

1;
