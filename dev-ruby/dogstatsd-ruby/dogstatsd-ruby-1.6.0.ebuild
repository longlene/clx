# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby DogStastd client"
HOMEPAGE="http://github.com/datadog/dogstatsd-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/yard-0.6.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.8"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

