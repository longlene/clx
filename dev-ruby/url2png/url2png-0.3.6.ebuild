# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Generate screenshots from websites almost instantly at any preferred size using ruby and the url2png"
HOMEPAGE="http://github.com/robinhoudmeyers/url2png-gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.11.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.8.3"
ruby_add_rdepend ">=dev-ruby/rcov-0"
ruby_add_rdepend ">dev-ruby/rspec-2.6.0"

