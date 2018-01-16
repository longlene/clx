# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" Develop mobile application using apache cordova and ruby utilities"
HOMEPAGE="http://github.com/lxsameer/Susanoo"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/thin-0"
ruby_add_rdepend ">=dev-ruby/colorize-0"
ruby_add_rdepend ">=dev-ruby/lotus-router-0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">=dev-ruby/rack-rewrite-0"
ruby_add_rdepend ">=dev-ruby/uglifier-2.1.1"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0.9.6"
ruby_add_rdepend ">=dev-ruby/sprockets-2.11.0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-0"
ruby_add_rdepend "=dev-ruby/sass-3.2.15"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"

