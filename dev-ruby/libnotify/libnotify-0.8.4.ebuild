# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://rubygems.org/gems/libnotify"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.11"
ruby_add_rdepend ">=dev-ruby/yard-0.8.6.1"
ruby_add_rdepend ">=dev-ruby/minitest-4.7.4"
ruby_add_rdepend ">=dev-ruby/minitest-libnotify-0.2.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

