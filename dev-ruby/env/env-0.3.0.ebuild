# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a Ruby interface to common environment variables, used on Windows, Linux, BSD and OSX"
HOMEPAGE="https://github.com/postmodern/env#readme"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.4"
ruby_add_rdepend ">=dev-ruby/yard-0.7"

