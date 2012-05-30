Andrew Bayer, @abayer

# #1 Use plugins productively

* Search for plugins to fit your needs.  Organized by category on the wiki and in the update center.

* If you're not using a plugin any more, disable it.

    * Save memory and reduce clutter on job configuration pages.

* Favorite plugins:

    * JobConfigHistory

        See the difference between job configuations now and then.
        With authentication enabled, you get to see who changed it
        and how.

    * Disk Usage

    * Build Timeout

        Can set a timeout to abort a build if it takes longer than
        a set time.

    * Email-ext

        Better control of when emails get sent and who they get
        sent to.  Format the emails ythe way you want using infromation
        from your builds.

    * Parametereized Trigger

        Kick off downstream builds with information from upstream.

# #2 Standardize your slaves

If you've got more than a couple builds, you've probably got
multiple slaves.  Ad hoc slaves my be conveinent, but you're
in for trouble if they have different environments.

Use Puppet or Chef to standardize what goes on the machines.  Have
Jenkins or your job install the tools.  Or, you can use a VM to
spawn your slaves.

Whatever method you choose, just make sure your slaves are consistent.

Don't build on master.  Always build on slaves.

* No conflict on memory/CPU/IO between master and builds.

* Easier to add slaves than to beef up master.

* Mixing build on master with builds on slaves means inconsistencies between builds.

# #3 Use incremental builds if possible

If your build takes 4-8 hours, you can't do real CI on every change.

If you're integrating with code review or other pre-tested commit
processes, you want to verify changes as fast as possible.

Incrememntal builds are complementary to full builds, not replacements.

# #4 Integrate with other tools

* Pre-tested commits with Gerrit (git code review)

* Sonar

    * Code metrics, code coverage, unit test results, etc, all in one place

    * Great graphs, charts, etc -- fantastic manager candy!

* Chat/IM notifications

# #5 Break up bloat

* Too many builds makes it hard to navigate the Jenkins UI and hurt
performance.

* Builds that try to do too much take too long and make it impossible
to restart a build process partway through.

* Don't be afraid to spread your jobs across multiple Jenkins masters.

* Split jobs in a logical way -- separate instances per group, per
product, per physical location, etc.

# #6 Stick with stable releases

* Jenkins releases weekly.  Rapid turnaround for features & fixes,
but not 100% stability for every release.

* Plugins release whenever the developers want to.

* Update center makes it easy to upgrade core & plugins, but that's
not always best.

* Use the Jenkins core LTS releases, every 3 months or so.

# #7 Join the community


vi: set ft=markdown:
