# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    A simple Ruby-based file system web server for serving
    static files out of a directory"
HOMEPAGE="https://github.com/schmich/fsws"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.5"
ruby_add_rdepend ">=dev-ruby/thin-1.6"
ruby_add_rdepend ">=dev-ruby/colorize-0.7"
ruby_add_rdepend ">=dev-ruby/rake-10.3"

